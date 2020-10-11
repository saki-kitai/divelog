class UsersController < ApplicationController
  
  #全ユーザー情報を取得
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
  end 

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'Your account has been successfully created!'
      redirect_to @user
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
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_picture)
  end 
  
end
