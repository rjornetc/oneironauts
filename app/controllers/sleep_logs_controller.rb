class SleepLogsController < ApplicationController

  respond_to :html, :json

#  require 'rasem'
  def index
      @sleep_logs = current_user.sleep_logs
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @sleep_logs.order(:date).to_json(:methods => [:log_dreams, :log_hours]) }
      end
      
#      @img = Rasem::SVGImage.new(300,300) do
#        
#        circle 20, 20, 5
#        circle 50, 50, 5
#        line 20, 20, 50, 50
#      end

  end

  def show
      @log = User.find(params[:user_id]).sleep_logs.find(params[:id])
  end

  def create
      @log = SleepLog.create(sleep_log_params)
      @log.user_id = current_user.id
      if @log.save
          redirect_to user_sleep_logs_path(current_user.id)
      else 
          flash[:alert] = 'You can only enter a Sleep Log Entry per date'
          redirect_to user_sleep_logs_path(current_user.id)
      end
  end

  def new
      @log = SleepLog.new
  end

  def destroy
      @log = User.find(params[:user_id]).sleep_logs.find(params[:id])
      @log.destroy
      redirect_to user_sleep_logs_path(current_user.id)
  end

  def delete
      @log = User.find(params[:user_id]).sleep_logs.find(params[:id])
  end

  def edit
      @log = User.find(params[:user_id]).sleep_logs.find(params[:id])
  end

  def update
      @log = User.find(params[:user_id]).sleep_logs.find(params[:id])
      if @log.update(sleep_log_params)
          redirect_to user_sleep_logs_path(current_user.id)
      else 
          flash[:alert] = 'You can only enter a Sleep Log Entry per date'
          redirect_to user_sleep_logs_path(current_user.id)
      end
  end
  
  private
      def sleep_log_params
          params.require(:sleep_log).permit(:date, :user_id, :start_time, :end_time)
      end
end
