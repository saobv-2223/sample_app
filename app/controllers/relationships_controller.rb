class RelationshipsController < ApplicationController
  before_action :logged_in

  def create
    @user = User.find_by id: params[:followed_id]
    if @user.present?
      current_user.follow @user
    else
      @error = t "follow.action_fail"
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    relationship = Relationship.find_by id: params[:id]
    if relationship.present?
      @user = relationship.followed
      current_user.unfollow @user
    else
      @error = t "follow.action_fail"
    end
    respond_to do |format|
      format.js
    end
  end
end
