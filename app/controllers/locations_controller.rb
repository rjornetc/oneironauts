class LocationsController < ApplicationController
  include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :location_not_authorized
    
    def index
        @locations = User.find(params[:user_id]).locations.all
        @user = User.find(params[:user_id])
    end
  
    def new
        @location = Location.new
        authorize @location
    end
  
    def create
        @location = Location.create(location_params)
        @location.user_id = current_user.id
        authorize @location
        if @location.save  
          flash[:notice] = "Location saved."  
          redirect_to user_location_path(user_id: current_user.id, id: @location.id)
        else  
          flash[:notice] = "Unable to save your location."  
          redirect_to new_user_location_path
        end
    end
  
    def edit
        @location = User.find(params[:user_id]).locations.find(params[:id])
        @user = User.find(params[:user_id])
        authorize @location
    end
  
    def update
        @location = User.find(params[:user_id]).locations.find(params[:id])
        authorize @location
        @location.user = current_user
        @location.update(location_params)
        redirect_to user_location_path(user_id: current_user.id, id: @location.id)
    end
  
    def delete
        @location = User.find(params[:user_id]).locations.find(params[:id])
        authorize @location
        
    end
  
    def destroy
        @location = User.find(params[:user_id]).locations.find(params[:id])
        authorize @location
    end
  
    def show
        @location = User.find(params[:user_id]).locations.find(params[:id])
        @user = User.find(params[:user_id])
        authorize @location
    end
    
    private
        def location_params
            params.require(:location).permit(:name, :description, :public, :user_id, :real)
        end
        
        def location_not_authorized
          flash[:alert] = "You aren't allowed to do that."
          redirect_to(request.referrer || root_path)
        end
  
end
