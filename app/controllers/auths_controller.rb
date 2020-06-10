class AuthsController < ApplicationController
  before_action :check_login, only: %i(new create)

  def new; end

  def create
    user = User.find_by email: params[:auth][:email].downcase
    if user&.authenticate(params[:auth][:password])
      if user.activated?
        params[:auth][:remember] == Settings.remember_me ? remember(user) : forget(user)
        log_in user
        redirect_back_or user_path user
      else
        flash[:warning] = t ".mail.no_activated"
        redirect_to login_path
      end
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

  def edit
    user = User.find_by email: params[:email]
    if user && !user.activated? && user.authenticated?(:activation, params[:token])
      user.activate
      log_in user
      flash[:success] = t ".mail.activate_success"
      redirect_to user
    else
      flash[:dark] = t ".mail.activate_fail"
      redirect_to root_path
    end
  end

  private

  def check_login
    return unless logged_in
    redirect_to user_path current_user
  end
end
