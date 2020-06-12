class FollowersController < ApplicationController
  before_action :find_user

  def index
    @title = t "follow.follower_title"
    @users = @user.followers.page(params[:page]).per Settings.per_page
    render "users/show_follow"
  end
end
