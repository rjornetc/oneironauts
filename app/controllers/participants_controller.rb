class ParticipantsController < ApplicationController

    def create
      @challenge = Challenge.find(params[:challenge_id])
      @participant = @challenge.participants.build(:user_id => params[:user_id])
      @participant.done= false
      authorize @participant
      if @participant.save
        flash[:notice] = "Added participant."
        redirect_to challenge_path(@challenge)
      else
        flash[:notice] = "Unable to add participant."
        redirect_to challenge_path(@challenge)
      end
    end

    def update
      @challenge = Challenge.find(params[:challenge_id])
      @participant = @challenge.participants.find(:user_id => params[:user_id])
      authorize @participant
      if @participant.update(participant_params)
        flash[:notice] = "Well done!"
        redirect_to challenge_path(@challenge)
      else
        flash[:notice] = "Unable to finish your action."
        redirect_to challenge_path(@challenge)
      end
    end

    def destroy
      @challenge = Challenge.find(params[:challenge_id])
      @participant = @challenge.participants.find_by_user_id(params[:user_id])
      authorize @participant
      @participant.destroy
      flash[:notice] = "Removed participant."
      redirect_to challenge_path(@challenge)
    end

    private
        def participant_params
            params.require(:participant).permit(:user_id, :challenge_id, :done, :done_date, :points)
        end
end
