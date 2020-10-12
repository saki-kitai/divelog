class LogsController < ApplicationController
  
  before_action :correct_user_of_log, only: [:edit, :update, :destroy]
  
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
    if @log.update(log_params)
      flash[:success] = 'Saved changes.'
      redirect_to @log
    else
      flash.now[:danger] = 'Oops!'
      render :edit
    end
  end 

  def destroy
    @log.destroy
    flash[:success] = "Successfully deleted the log."
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def log_params
    params.require(:log).permit(:date, :weather, :wind, :temperature, :water_temperature, :start_time, :end_time, :total_time, :country, :area, :point, :entry_type, :weight, :buddy, :visibility, :current, :max_depth, :avg_depth, :start_bar, :end_bar, :bar_used, :image1, :image2, :comment)
  end 
  
  def correct_user_of_log
    @log = current_user.logs.find_by(id: params[:id])
    unless @log
      redirect_to current_user
    end
  end
  
end
