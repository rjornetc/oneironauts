class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
      
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
      else
        session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
        @user.email    = session["devise.twitter_data"]['info']['nickname']+'@change.me'
        @user.password = Devise.friendly_token[0,20]
        @user.username = session["devise.twitter_data"]['info']['nickname']
        @user.role     ||= Role.find_by_name('registered')
        @user.confirmed_at = Time.now
        sign_in_and_redirect @user, :event => :authentication
      end
    end
    
   def update_resource(resource, params)
       if current_user.provider
         params.delete("current_password")
         resource.update_without_password(params)
       else
         resource.update_with_password(params)
       end
     end
end
