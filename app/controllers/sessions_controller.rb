class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to expenses_path
    else
      flash.now[:alert] = 'Invalid email/password!'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:success] = "You have been logged out."
    redirect_to root_url
  end
end