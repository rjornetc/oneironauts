class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :check_user_achievements
  protect_from_forgery with: :exception
  
  protected
  
    def check_user_achievements
        User.all.each do |user|
            Achievement.all.each do |a|
                if eval(a.conditions.to_s)
                    Achieved.where(user_id: user.id, achievement_id: a.id).first_or_create
                end
            end
        end
        
       Challenge.all.each do |a|
           a.users.each do |user|
                if eval(a.conditions.to_s)
                    p = Participant.where(user_id: user.id, challenge_id: a.id).first
                    p.done = true 
                    p.done_date = Time.now
                    p.save
                end
            end
        end
    end
    
    def add_log(user_id, owner_id, points, notificable, description)
        Log.create(user_id: user_id, owner_id: owner_id, points: points, notificable: notificable, description: description).save
        u = User.find(user_id)
        u.points += points
        u.save
    end
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :remember_me) }
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :role, :points, :current_password, :avatar) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:password, :password_confirmation, :username, :email, :points, :role, :public, :current_password, :avatar, :public_profile, :public_sleep_log) }
    end
end
