class PostsController < ApplicationController
  def index
      @posts = Post.all
  end

  def new
      @post = Post.new
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
        redirect_to post_path(@post)
      end 
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
      @post.user = current_user
  end

  def delete
      @post = Post.find(params[:id])
  end

  def destroy
      @post = Post.find(params[:id])
  end

  def vote_up
      @post = Post.find(params[:id])
  end

  def vote_down
      @post = Post.find(params[:id])
  end
  
  private
      def post_params
          params.require(:post).permit(:title, :content, :votes)
      end
end
