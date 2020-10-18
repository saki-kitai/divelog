class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    log = Log.find(params[:log_id])
    current_user.like(log)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    log = Log.find(params[:id])
    current_user.unlike(log)
    redirect_back(fallback_location: root_path)
  end

end
