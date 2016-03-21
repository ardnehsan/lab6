class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params.require(:post).permit(:content)
    @post.user = @current.user
    if @post.save
      redirect_to dashboard_path
    else
      render :new
    end
  end


end
