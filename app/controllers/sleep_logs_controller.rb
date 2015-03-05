class SleepLogsController < ApplicationController
  require 'rasem'
  def index
      
      @img = Rasem::SVGImage.new(300,300) do
        
        circle 20, 20, 5
        circle 50, 50, 5
        line 20, 20, 50, 50
      end
  end

  def create
  end

  def new
  end

  def destroy
  end

  def delete
  end

  def edit
  end

  def update
  end
end
