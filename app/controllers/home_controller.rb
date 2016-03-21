class HomeController < ApplicationController

  before_action :authenticate_user

  def site
  end

  def dashboard
  @post = Post.new
  followers_id = @current_user.following_users.pluck(:id)
  timeline = followers_id << @current_user.id
  @posts = Post.where(user_id: timeline).order("created_at DESC").page params[:page]

  @users = User.all
  end

  def create
    @post = Post.new params.require(:post).permit(:content)
    @post.user = @post_user
    if @post.save
      redirect_to dashboard_path
    else
      render :new
    end
  end
end
