class DreamsController < ApplicationController

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :dream_not_authorized

  def index
      @dreams = User.find(params[:user_id]).dreams.all
      @user = User.find(params[:user_id])
  end

  def create
      @dream = Dream.create(dream_params)
      @dream.user_id = current_user.id
      authorize @dream
      if @dream.save
        flash[:notice] = "Dream saved."
        redirect_to user_dream_path(user_id: current_user.id, id: @dream.id)
      else
        flash[:notice] = "Unable to save your dream."
        redirect_to new_user_dream_path
      end
  end

  def new
      @dream = Dream.new
      authorize @dream
  end

  def delete
      @dream = User.find(params[:user_id]).dreams.find(params[:id])
      authorize @dream
  end

  def destroy
      @dream = User.find(params[:user_id]).dreams.find(params[:id])
      authorize @dream
  end

  def show
      @dream = User.find(params[:user_id]).dreams.find(params[:id])
      @user = User.find(params[:user_id])
      authorize @dream
  end

  def edit
      @dream = User.find(params[:user_id]).dreams.find(params[:id])
      @user = User.find(params[:user_id])
      authorize @dream
  end

  def update
      @dream = User.find(params[:user_id]).dreams.find(params[:id])
      authorize @dream
      @dream.user = current_user
      @dream.update(dream_params)
      redirect_to user_dream_path(user_id: current_user.id, id: @dream.id)
  end

  private
      def dream_params
          params.require(:dream).permit(:title, :content, :votes, :user_id, :interpretation, :public, :date, dream_characters_attributes: [:id, :dream_id, :character_id, :_destroy], dream_locations_attributes: [:id, :dream_id, :location_id, :_destroy], dream_has_tags_attributes: [:id, :dream_id, :dream_tag_id, :_destroy])
      end

      def dream_not_authorized
        flash[:alert] = "You aren't allowed to do that."
        redirect_to(request.referrer || root_path)
      end

end
