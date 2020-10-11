module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def logged_in?
        !!current_user
    end 
    
    def correct_user?
      @user = User.find(params[:id])
      if @user == current_user
        return true
      else
        return false
      end 
    end
        
end
