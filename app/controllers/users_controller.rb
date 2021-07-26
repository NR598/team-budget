class UsersController < ApplicationController
  def index
    if logged_in?
      @user = User.all
    else
      redirect_to root_path
    end  
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end  
  end

  def new
    if current_user == nil
      @user = User.new
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to transactions_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end
