class FollowController < ApplicationController

  before_action :authenticate_user

  def create
    new_user = User.find params[:id]
    @current_user.follow new_user
    redirect_to dashboard_path, notice: "Following #{new_user.email}"
  end
  def delete
    new_user = User.find params[:id]
    @current_user.stop_following new_user
    redirect_to dashboard_path, notice: "Unfollow #{new_user.email}"
  end
end
