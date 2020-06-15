class SimplePagesController < ApplicationController
  def home
    return unless logged_in
    @micro_post = current_user.micro_posts.build
    @feeds = current_user.feed.by_created_at.page(params[:page]).per Settings.per_page
  end

  def help; end
end
