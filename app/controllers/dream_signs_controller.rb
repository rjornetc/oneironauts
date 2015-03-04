class DreamSignsController < ApplicationController
  def index
  end
  
  def show
      @dream_sign = DreamSign.find(params[:id])
  end

  def create
      @dream_sign = DreamSign.create(dream_sign_params)
      @dream_sign.user_id = current_user.id
      if @dream_sign.save
          redirect_to dream_sign_path(@dream_sign)
      end
  end

  def new
      @dream_sign = DreamSign.new
  end

  def delete
      @dream_sign = DreamSign.find(params[:id])
  end

  def destroy
      @dream_sign = DreamSign.find(params[:id])
  end

  def update
      @dream_sign = DreamSign.find(params[:id])
  end
  
  private
      def dream_sign_params
          params.require(:dream_sign).permit(:name, :user_id)
      end
  
end
