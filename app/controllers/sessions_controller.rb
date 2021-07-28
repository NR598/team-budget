
class SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: :create
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to transactions_path
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

  def google_auth
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      access_token = auth
      u.google_token = auth.credentials.token
      refresh_token = auth.credentials.refresh_token
      u.google_refresh_token = refresh_token if refresh_token.present?
      u.password = SecureRandom.urlsafe_base64
    end
    log_in @user
    redirect_to transactions_path
  end

private

  def auth
    request.env['omniauth.auth']
  end

end