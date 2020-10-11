class ToppagesController < ApplicationController
  def index
    @logs = Log.order(id: :desc).page(params[:page])
    @user = User.find_by(id: session[:user_id])
  end 
end
