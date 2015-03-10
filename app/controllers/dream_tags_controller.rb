class DreamTagsController < ApplicationController
  include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :tag_not_authorized

    def index
        @tags = DreamTag.all
    end

    def new
        @tag = DreamTag.new
        authorize @tag
    end

    def create
        @tag = DreamTag.create(tag_params)
        @tag.user_id = current_user.id
        authorize @tag
        if @tag.save
          flash[:notice] = "Dream tag saved."
          redirect_to dream_tag_path(@tag.id)
        else
          flash[:notice] = "Unable to save your tag."
          redirect_to new_dream_tag_path
        end
    end

    def edit
        @tag = DreamTag.find(params[:id])
        authorize @tag
    end

    def update
        @tag = DreamTag.find(params[:id])
        authorize @tag
        @tag.update(tag_params)
        redirect_to dream_tag_path(@tag.id)
    end

    def delete
        @tag = DreamTag.find(params[:id])
        authorize @tag

    end

    def destroy
        @tag = DreamTag.find(params[:id])
        authorize @tag
    end

    def show
        @tag = DreamTag.find(params[:id])
        authorize @tag
    end

    private
        def tag_params
            params.require(:dream_tag).permit(:name, :user_id)
        end

        def tag_not_authorized
          flash[:alert] = "You aren't allowed to do that."
          redirect_to(request.referrer || root_path)
        end

end
