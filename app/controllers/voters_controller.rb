class VotersController < ApplicationController

  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :vote_not_authorized

  def create 
    set_votable
    @voter = @votable.voters.build(:user_id => params[:user_id]) 
    @voter.positive = params[:positive]
    authorize @voter 
    if @voter.positive
        @votable.votes += 1
        @votable.save
    else
        @votable.votes -= 1
        @votable.save
    end
    if @voter.save  
      flash[:notice] = "Thank you for voting."  
    else  
      flash[:notice] = "Unable to vote."  
    end 
    if params[:votable_type] == 'Post'
        redirect_to post_path(@votable)
    elsif params[:votable_type] == 'Meaning'
        redirect_to dream_sign_path(@votable.dream_sign_id)
    elsif params[:votable_type] == 'Dream'
        redirect_to user_dream_path(user_id: @votable.user.id, id:@votable.id)
    elsif params[:votable_type] == 'Comment'
        redirect_to post_path(parent_post(@votable))
    end 
  end  
  
  def destroy 
    set_votable
    @voter = @votable.voters.find_by_user_id(params[:user_id])
    authorize @voter 
    if @voter.positive
        @votable.votes -= 1
        @votable.save
    else
        @votable.votes += 1
        @votable.save
    end 
    @voter.destroy  
    flash[:notice] = "Removed vote."  
    if params[:votable_type] == 'Post'
        redirect_to post_path(@votable)
    elsif params[:votable_type] == 'Meaning'
        redirect_to dream_sign_path(@votable.dream_sign_id)
    elsif params[:votable_type] == 'Dream'
        redirect_to user_dream_path(user_id: @votable.user.id, id:@votable.id)
    elsif params[:votable_type] == 'Comment'
        redirect_to post_path(parent_post(@votable))
    end
  end

  private
      def parent_post(c)
          if c.has_attribute?(:commentable_id)
              parent_post(c.commentable)
          elsif c.instance_of?(Dream)
              user_dream_path(user_id: c.user_id, id: c.id)
          else
              c
          end
      end
  
      def vote_not_authorized
        flash[:alert] = "You aren't allowed to vote."
        redirect_to(request.referrer || root_path)
      end
      
      def set_votable
          if params[:votable_type] == 'Post'
              @votable = Post.find(params[:votable_id])
          elsif params[:votable_type] == 'Meaning'
              @votable = Meaning.find(params[:votable_id])
          elsif params[:votable_type] == 'Dream'
              redirect_to Dream.find(params[:votable_id])
          elsif params[:votable_type] == 'Comment'
              @votable = Comment.find(params[:votable_id])
          end
          puts @votable
      end
  
end
