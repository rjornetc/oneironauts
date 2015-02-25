class PostsController < ApplicationController
  def index
      @posts = Post.all
  end

  def new
      @post = Post.new
  end

  def create
      @post = Post.new(post_params)
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
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
