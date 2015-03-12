class AchievementsController < ApplicationController
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :achievement_not_authorized

  def index
      @achievements = Achievement.all
  end

  def new
      @achievement = Achievement.new
      authorize @achievement
  end

  def create
      @achievement = Achievement.find(params[:id])
      authorize @achievement
      if @achievement.save
        flash[:notice] = "Achievement created."
        redirect_to achievement_path(@achievement)
      else
        flash[:notice] = "Unable to create that achievement."
        redirect_to new_achievement_path
      end
  end

  def edit
      @achievement = Achievement.find(params[:id])
      authorize @achievement
  end

  def update
      @achievement = Achievement.find(params[:id])
      authorize @achievement
      @achievement.update(achievement_params)
      redirect_to achievement_path(@achievement)
  end

  def delete
      @achievement = Achievement.find(params[:id])
      authorize @achievement
  end

  def destroy
      @achievement = Achievement.find(params[:id])
      authorize @achievement
      @achievement.destroy
  end

  def show
    @achievement = Achievement.find(params[:id])
  end

  private
      def achievement_params
          params.require(:achievement).permit(:name, :badge_id, :description)
      end

      def achievement_not_authorized
        flash[:alert] = "You aren't allowed to do that."
        redirect_to(request.referrer || root_path)
      end
end
