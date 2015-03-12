class CharactersController < ApplicationController

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :character_not_authorized

  def index
      @characters = User.find(params[:user_id]).characters.all
      @user = User.find(params[:user_id])
  end

  def new
      @character = Character.new
      authorize @character
  end

  def create
      @character = Character.create(character_params)
      @character.user_id = current_user.id
      authorize @character
      if @character.save
        flash[:notice] = "Character saved."
        redirect_to user_character_path(user_id: current_user.id, id: @character.id)
      else
        flash[:notice] = "Unable to save your character."
        redirect_to new_user_character_path
      end
  end

  def edit
      @character = User.find(params[:user_id]).characters.find(params[:id])
      @user = User.find(params[:user_id])
      authorize @character
  end

  def update
      @character = User.find(params[:user_id]).characters.find(params[:id])
      authorize @character
      @character.user = current_user
      @character.update(character_params)
      redirect_to user_character_path(user_id: current_user.id, id: @character.id)
  end

  def delete
      @character = User.find(params[:user_id]).characters.find(params[:id])
      authorize @character

  end

  def destroy
      @character = User.find(params[:user_id]).characters.find(params[:id])
      authorize @character
  end

  def show
      @character = User.find(params[:user_id]).characters.find(params[:id])
      @user = User.find(params[:user_id])
      authorize @character
  end

  private
      def character_params
          params.require(:character).permit(:name, :description, :public, :user_id, :real, :age, :gender, :icon)
      end

      def character_not_authorized
        flash[:alert] = "You aren't allowed to do that."
        redirect_to(request.referrer || root_path)
      end
end
