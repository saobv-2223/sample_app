class FollowingController < ApplicationController
  before_action :find_user

  def index
    @title = t "follow.following_title"
    @users = @user.following.page(params[:page]).per Settings.per_page
    render "users/show_follow"
  end
end
