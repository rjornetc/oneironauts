class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
      
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
      else
        session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
        @user.email    = 'change@me.please'
        @user.password = Devise.friendly_token[0,20]
        @user.username = request.env["omniauth.auth.nickname"]
        @user.role     ||= Role.find_by_name('registered')
        @user.confirmed_at = Time.now
        @user.save
        sign_in_and_redirect @user, :event => :authentication
      end
    end
end
