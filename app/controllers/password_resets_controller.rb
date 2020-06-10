class PasswordResetsController < ApplicationController
  before_action :get_user, :valid_user, only: %i(edit update)

  def new; end

  def create
    @user = User.find_by email: params[:auth][:email].downcase
    if @user
      @user.create_reset_digest
      @user.send_mail_reset_password
      flash[:success] = t "auths.forget_password.send_request_success"
      redirect_to root_path
    else
      flash[:danger] = t "users.no_exist"
      render :new
    end
  end

  def edit; end

  def update
    if params[:user][:password].blank? || params[:user][:password_confirmation].blank?
      flash[:danger] = t "activerecord.errors.models.user.attributes.password.blank"
    elsif @user.update_attributes update_password_params
      flash[:success] = t "auths.forget_password.reset_password_success"
      log_in @user
      redirect_to @user
    else
      flash[:warning] = t "auths.forget_password.reset_password_fail"
      render :edit
    end
  end

  private

  def update_password_params
    params.require(:user).permit(:password, :password_confirmation).merge(reset_digest: nil)
  end

  def get_user
    @user = User.find_by email: params[:email]
  end

  def valid_user
    return if @user && @user.authenticated?(:reset, params[:id])
    flash[:warning] = t "auths.forget_password.error_token_or_unactivated"
    redirect_to root_path
  end
end
