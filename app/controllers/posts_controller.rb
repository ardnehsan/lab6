class PostsController < ApplicationController

  before_action do
    @post = Post.order("created_at desc").page params[:page]
    authenticate_user

  end

  def create
    @post = Post.new params.require(:post).permit(:content)
    @post.user = @current_user
    if @post.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def index
    @post. Post.all
  end
end
