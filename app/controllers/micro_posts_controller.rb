class MicroPostsController < ApplicationController
  before_action :check_login, only: %i(create destroy)
  before_action :correct_user, only: :destroy

  def create
    @micro_post = current_user.micro_posts.build create_micropost_params
    @micro_post.image.attach create_micropost_params[:image]
    if @micro_post.save
      flash[:success] = t "microposts.create_success"
      redirect_to root_path
    else
      flash[:warning] = t "microposts.create_fail"
      @feeds = current_user.micro_posts.by_created_at.page(params[:params]).per Settings.per_page
      render "simple_pages/home"
    end
  end

  def destroy
    if @micro_post.destroy
      flash[:success] = t "microposts.delete_success"
    else
      flash[:warning] = t "microposts.delete_fail"
    end
    redirect_to request.referer || root_path
  end

  private

  def correct_user
    @micro_post = current_user.micro_posts.find_by id: params[:id]
    return if @micro_post
    flash[:danger] = t "auths.incorrect_user"
    redirect_to root_path
  end

  def check_login
    return if logged_in
    store_location
    flash[:warning] = t "auths.not_login"
    redirect_to login_path
  end

  def create_micropost_params
    params.require(:micro_post).permit :content, :image
  end
end
