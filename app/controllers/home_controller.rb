class HomeController < ApplicationController

  before_action :authenticate_user

  def site
  end

  def dashboard
  @post = Post.new
  @user= User.find_by id: params[:id]
   @current_user = User.find_by id: session[:user_id]
      if @current_user && @current_user.following_users.present?
        follower_ids = @current_user.following_users.pluck(:id)
        timeline = follower_ids << @current_user.id
        @posts = Post.where(user_id: timeline).order("created_at DESC")
      else
        @posts = Post.all.order("created_at desc")
    end
  end

end
