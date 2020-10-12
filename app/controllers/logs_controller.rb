class LogsController < ApplicationController
  
  #before_action :要設定
  
  def show
    @log = Log.find(params[:id])
  end

  def new
    @log = current_user.logs.build
  end

  def create
    @log = current_user.logs.build(log_params)
    if @log.save
      flash[:success] = 'Posted your new log!'
      redirect_to current_user
    else
      flash.now[:danger] = 'Oops!'
      render :new
    end
    
    
    
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def log_params
    params.require(:log).permit(:date, :weather, :wind, :temperature, :water_temperature, :start_time, :end_time, :total_time, :country, :area, :point, :entry_type, :weight, :buddy, :visibility, :current, :max_depth, :avg_depth, :start_bar, :end_bar, :bar_used, :image1, :image2, :comment)
  end 
end
