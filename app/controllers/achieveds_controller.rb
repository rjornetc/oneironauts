class AchievedsController < ApplicationController

    def create
      @achievement = Achievement.find(params[:achievement_id])
      @achieved = @achievement.achieveds.build(:user_id => params[:user_id])
      @achieved.done= false
      authorize @achieved
      if @achieved.save
        flash[:notice] = "Added achieved."
        redirect_to achievement_path(@achievement)
      else
        flash[:notice] = "Unable to add achieved."
        redirect_to achievement_path(@achievement)
      end
    end

    def update
      @achievement = Achievement.find(params[:achievement_id])
      @achieved = @achievement.achieveds.find(:user_id => params[:user_id])
      authorize @achieved
      if @achieved.update(achieved_params)
        flash[:notice] = "Well done!"
        redirect_to achievement_path(@achievement)
      else
        flash[:notice] = "Unable to finish your action."
        redirect_to achievement_path(@achievement)
      end
    end

    def destroy
      @achievement = Achievement.find(params[:achievement_id])
      @achieved = @achievement.achieveds.find_by_user_id(params[:user_id])
      authorize @achieved
      @achieved.destroy
      flash[:notice] = "Removed."
      redirect_to achievement_path(@achievement)
    end

    private
        def achieved_params
            params.require(:achieved).permit(:user_id, :achievement_id, :done)
        end
end
