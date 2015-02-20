class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
  end

  # POST /resource
  def create
    authorize @user
    @user.role = Role.find(1)
    @user.save
  end

  # GET /resource/edit
  def edit
    authorize @user
  end

  # PUT /resource
  def update
    authorize @user
  end

  # DELETE /resource
  def destroy
    authorize @user
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    authorize @user
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
      authorize @user
      respond_to do |format|
          format.html # show.html.erb
          format.xml { render :xml => @user }
      end
    end
  
  protected
    
    def update_resource(resource, params)
        resource.update_without_password(params)
    end
end
