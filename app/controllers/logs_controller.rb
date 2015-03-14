class LogsController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def delete
  end
  
  protected
      def modify_points(user_id, points)
          @user = User.find(user_id)
          @user.points += points
          @user.save
      end
      
  private
      def log_params
          params.require(:log).permit(:user_id, :owner_id, :points, :notificable, :description)
      end
end
