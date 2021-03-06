class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # POST /resource
  def create
    if session[:omniauth] == nil
        super do
            resource.points = 50
            resource.bio = ''
            resource.public_sleep_log = true
            resource.public_profile = true
            resource.role = Role.find_by_name('registered')
            resource.save
        end
    else
        super do
            resource.points = 50
            resource.bio = ''
            resource.public_sleep_log = true
            resource.public_profile = true
            resource.role = Role.find_by_name('registered')
            resource.save
        end
        session[:omniauth] = nil unless @user.new_record? #OmniAuth
      end
  end

  # GET /resource/edit
  def edit
    authorize @user
  end

  # PUT /resource
  def update
    authorize @user
    super
  end

  # DELETE /resource
  def destroy
    authorize @user
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    authorize @user
    super
  end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
  def show
      @user = User.find(params[:id])
      
      @friends = Array.new
      @user.friends.each do |friend|
          if @user.inverse_friends.include?(friend)
              @friends << friend
          end 
      end 
      
      @followers = Array.new
      @user.inverse_friends.each do |friend|
          if !@user.friends.include?(friend)
              @followers << friend
          end 
      end 
      
      @following = Array.new
      @user.friends.each do |friend|
          if !@user.inverse_friends.include?(friend)
              @following << friend
          end 
      end 
      
      authorize @user
      respond_to do |format|
          format.html # show.html.erb
          format.xml { render :xml => @user }
      end
  end
    
  
  def delete_avatar
     @user = User.find(params[:id])
     @user.avatar = nil
     @user.save
     redirect_to user_profile_path(@user) and return
  end  
    
  
  protected
  
  
    def after_update_path_for(resource)
        user_profile_path(resource)
    end
    
    def update_resource(resource, params)
        resource.update_without_password(params)
    end
    
  private
  
    def user_not_authorized
      flash[:alert] = "This user's profile is private."
      redirect_to(request.referrer || root_path)
    end
    
end
