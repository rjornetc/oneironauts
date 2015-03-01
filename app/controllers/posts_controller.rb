class PostsController < ApplicationController

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :post_not_authorized

  def index
      @posts = Post.all
  end

  def new
      @post = Post.new
      authorize @post
  end
  

  def create
      @post = Post.new(post_params)
      @post.user = current_user
      authorize @post 
      if @post.save  
        flash[:notice] = "Post published."  
        redirect_to post_path(@post)
      else  
        flash[:notice] = "Unable to publish that post."  
        redirect_to new_post_path
      end 
  end

  def edit
      @post = Post.find(params[:id])
      authorize @post
  end

  def update
      @post = Post.find(params[:id])
      authorize @post
      @post.user = current_user
      @post.update(post_params)
      redirect_to post_path(@post)
  end

  def delete
      @post = Post.find(params[:id])
      authorize @post
  end
  
  def show
      @post = Post.find(params[:id])
      authorize @post
  end

  def destroy
      @post = Post.find(params[:id])
      authorize @post
      @post.destroy
  end
  
  private
      def post_params
          params.require(:post).permit(:title, :content, :votes, :user_id, :draft, :post_categories, :categories)
      end
      
      def post_not_authorized
        flash[:alert] = "You aren't allowed to do that."
        redirect_to(request.referrer || root_path)
      end
end
