class MeaningsController < ApplicationController
  def index
  end

  def create
      @meaning = Meaning.create(meaning_params)
      @meaning.user = current_user
      @dream_sign = DreamSign.find(params[:dream_sign_id])
      @meaning.dream_sign = @dream_sign
      if @meaning.save
          redirect_to @meaning.dream_sign
      end
  end

  def new
      @meaning = Meaning.new
  end

  def delete
  end

  def destroy
  end

  def update
  end

  def mark_as_spam
  end

  def vote_up
  end

  def vote_down
  end
  
  private
      def meaning_params
          params.require(:meaning).permit(:description, :dream_sign_id, :user_id)
      end
end
