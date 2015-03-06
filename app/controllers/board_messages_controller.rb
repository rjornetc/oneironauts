class BoardMessagesController < ApplicationController
  
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :message_not_authorized
  
  def index
      @messages = BoardMessage.all
  end

  def create
      @message = BoardMessage.create(message_params)
      @message.user_id = params[:user_id]
      @message.group_id = params[:group_id]
      authorize @message
      if @message.save
          redirect_to @message.group
      end
  end

  def update
      @message = BoardMessage.find(params[:id])
      @group = @message.group
      authorize @message
      if @message.update(message_params)
          redirect_to @group
      end
  end

  def new
      @message = BoardMessage.new
      authorize @message
  end

  def edit
      @message = BoardMessage.find(params[:id])
      authorize @message
  end

  def delete
      @message = BoardMessage.find(params[:id])
      authorize @message
  end

  def destroy
      @message = BoardMessage.find(params[:id])
      @group = @message.group
      authorize @message
      @message.destroy
      redirect_to @group
  end

  def show
      @message = BoardMessage.find(params[:id])
      authorize @message
  end
  
  private
      def message_params
          params.require(:board_message).permit(:content, :user_id, :group_id)
      end
      
      def message_not_authorized
        flash[:alert] = "You aren't allowed to chat in this group."
        redirect_to(request.referrer || root_path)
      end
end
