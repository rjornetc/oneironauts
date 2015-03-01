class CommentsController < ApplicationController

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :comment_not_authorized

  def index
      @comments = Comment.all
  end

  def new
      @comment = Comment.new
      authorize @comment
  end

  def create
      @comment = Comment.new(comment_params)
      authorize @comment
      if params[:commentable_type] == "Post"
          @commentable    = Post.find(params[:commentable_id])
      elsif params[:commentable_type] == "Comment"
          @commentable    = Comment.find(params[:commentable_id])
      end
      @comment.user = current_user
      @comment.commentable = @commentable
      if @comment.save  
        flash[:notice] = "Comment published."  
      else  
        flash[:notice] = "Unable to publish your comment."  
      end 
      if params[:commentable_type] == "Post"
          redirect_to post_path(params[:commentable_id])
      elsif params[:commentable_type] == "Comment"
          redirect_to parent_post(@comment)
      end
  end

  def edit
      set_comment
      authorize @comment
  end

  def update
      set_comment
      authorize @comment
      @comment.save
  end

  def delete
      set_comment
      authorize @comment
  end
  

  def destroy
      set_comment
      authorize @comment
      @comment.destroy
  end

  def mark_as_spam
      set_comment
      authorize @comment
  end
  
  private
      def parent_post(c)
          if c.has_attribute?(:commentable_id)
              parent_post(c.commentable)
          else
              c
          end
      end
      
      def set_comment
          @comment = Comment.find(params[:id])
      end
      
      def comment_params
          params.require(:comment).permit(:content, :votes, :user_id, :commentable_id, :commentable_type, :spam)
      end
      
      def comment_not_authorized
        flash[:alert] = "You aren't allowed to do that."
        redirect_to(request.referrer || root_path)
      end
end
