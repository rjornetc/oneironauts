class ChallengesController < ApplicationController

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :challenge_not_authorized

  def index
      @challenges = Challenge.all
  end

  def new
      @challenge = Challenge.new
      authorize @challenge
  end

  def create
      @challenge = Challenge.create(challenge_params)
      authorize @challenge
      if @challenge.save
        flash[:notice] = "Challenge created."
        redirect_to challenge_path(@challenge)
      else
        flash[:notice] = "Unable to create that challenge."
        redirect_to new_challenge_path
      end
  end

  def edit
      @challenge = Challenge.find(params[:id])
      authorize @challenge
  end

  def update
      @challenge = Challenge.find(params[:id])
      authorize @challenge
      @challenge.update(challenge_params)
      redirect_to challenge_path(@challenge)
  end

  def delete
      @challenge = Challenge.find(params[:id])
      authorize @challenge
  end

  def destroy
      @challenge = Challenge.find(params[:id])
      authorize @challenge
      @challenge.destroy
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  private
      def challenge_params
          params.require(:challenge).permit(:name, :badge_id, :description)
      end

      def challenge_not_authorized
        flash[:alert] = "You aren't allowed to do that."
        redirect_to(request.referrer || root_path)
      end
end
