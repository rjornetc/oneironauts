class CategoriesController < ApplicationController

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :category_not_authorized

  def index
      @categories = Category.all
  end

  def new
      @category = Category.new
      authorize @category
  end

  def create
      @category = Category.find(params[:id])
      authorize @category
      @category.user = current_user
      if @category.save
        flash[:notice] = "Category published."
        redirect_to category_path(@category)
      else
        flash[:notice] = "Unable to publish that category."
        redirect_to new_category_path
      end
  end

  def edit
      @category = Category.find(params[:id])
      authorize @category
  end

  def update
      @category = Category.find(params[:id])
      authorize @category
      @category.user = current_user
      @category.update(category_params)
      redirect_to category_path(@category)
  end

  def delete
      @category = Category.find(params[:id])
      authorize @category
  end

  def destroy
      @category = Category.find(params[:id])
      authorize @category
      @category.destroy
  end

  def show
    @category = Category.find(params[:id])
  end

  private
      def category_params
          params.require(:category).permit(:name, :user_id)
      end

      def post_not_authorized
        flash[:alert] = "You aren't allowed to do that."
        redirect_to(request.referrer || root_path)
      end
end
