class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:edit, :update, :destroy, :followings, :followers, :likes]
  before_action :correct_user_check, only:[:newlog, :edit, :update, :destroy]
  
  #全ユーザー情報を取得
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @logs = @user.logs.order(id: :desc).page(params[:page])
    counts(@user)
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'Your account has been successfully created!'
      redirect_to '/login'
    else
      flash.now[:danger] = 'Oops!'
      render :new
    end 
    
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'You have successfully updated your profile.'
      redirect_to @user
    else
      flash.now[:danger] = 'Oops!'
      render :edit
    end
  end 

  def destroy
  end
  
  def newlog
    @user = current_user
    @log = @user.logs.build
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_picture)
  end 
  
  def correct_user_check
    @user = User.find(params[:id])
    unless correct_user?
      redirect_to @user
    end 
  end 

end
