class BadgesController < ApplicationController
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :badge_not_authorized

  def index
      @badges = Badge.all
  end

  def new
      @badge = Badge.new
      authorize @badge
  end

  def create
      @badge = Badge.create(badge_params)
      authorize @badge
      if @badge.save
        flash[:notice] = "Badge created."
        redirect_to badge_path(@badge)
      else
        flash[:notice] = "Unable to create that badge."
        redirect_to new_badge_path
      end
  end

  def edit
      @badge = Badge.find(params[:id])
      authorize @badge
  end

  def update
      @badge = Badge.find(params[:id])
      authorize @badge
      @badge.update(badge_params)
      redirect_to badge_path(@badge)
  end

  def delete
      @badge = Badge.find(params[:id])
      authorize @badge
  end

  def destroy
      @badge = Badge.find(params[:id])
      authorize @badge
      @badge.destroy
  end

  def show
    @badge = Badge.find(params[:id])
  end

  private
      def badge_params
          params.require(:badge).permit(:name, :points, :prize_id, :description, :icon)
      end

      def badge_not_authorized
        flash[:alert] = "You aren't allowed to do that."
        redirect_to(request.referrer || root_path)
      end
end
