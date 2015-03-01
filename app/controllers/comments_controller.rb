class CommentsController < ApplicationController
  def index
      set_comment
  end

  def new
      @comment = Comment.new
  end

  def create
      @comment = Comment.new(comment_params)
      @post    = Post.find(params[:post_id])
      @comment.user = current_user
      @comment.post = @post
      @comment.save
      redirect_to post_path(@comment.post.id)
  end

  def edit
      set_comment
  end

  def update
      set_comment
      @comment.save
  end

  def delete
      set_comment
  end

  def destroy
      set_comment
      @comment.destroy
  end

  def vote_up
      set_comment
  end

  def vote_down
      set_comment
  end

  def mark_as_spam
      set_comment
  end
  
  private
      def set_comment
          @comment = Comment.find(params[:id])
      end
      
      def comment_params
          params.require(:comment).permit(:content, :votes, :user_id, :post_id)
      end
end
