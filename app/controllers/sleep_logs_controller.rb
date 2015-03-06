class SleepLogsController < ApplicationController
  require 'rasem'
  def index
      
      @img = Rasem::SVGImage.new(300,300) do
        
        circle 20, 20, 5
        circle 50, 50, 5
        line 20, 20, 50, 50
      end
  end

  def show
      @log = User.find(params[:user_id]).sleep_logs.find(params[:id])
  end

  def create
      @log = SleepLog.create(sleep_log_params)
      @log.user_id = current_user.id
      if @log.save
          redirect_to user_sleep_log_path(user_id: current_user.id, id: @log.id)
      end
  end

  def new
      @log = SleepLog.new
  end

  def destroy
      @log = User.find(params[:user_id]).sleep_logs.find(params[:id])
  end

  def delete
      @log = User.find(params[:user_id]).sleep_logs.find(params[:id])
  end

  def edit
      @log = User.find(params[:user_id]).sleep_logs.find(params[:id])
  end

  def update
      @log = User.find(params[:user_id]).sleep_logs.find(params[:id])
  end
  
  private
      def sleep_log_params
          params.require(:sleep_log).permit(:date, :user_id, :start_time, :end_time)
      end
end
