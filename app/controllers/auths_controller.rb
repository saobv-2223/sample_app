class AuthsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:auth][:email].downcase
    if user&.authenticate(params[:auth][:password])
      flash[:success] = t ".login_success"
      params[:auth][:remember] == Settings.remember_me ? remember(user) : forget(user)
      log_in user
      redirect_to user
    else
      flash[:warning] = t ".login_fail"
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = t ".logout_success"
    redirect_to login_path
  end
end
