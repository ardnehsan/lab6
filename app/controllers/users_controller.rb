class UsersController < ApplicationController

  before_action :authenticate_user, only: [:follow, :delete]

  def index
    @user = User.all
    @users = User.order(:email).page params[:page]
    @post=Post.all.reverse
    @users = Kaminari.paginate_array(@users).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

def show
  @user_profile= User.find_by id: params[:id]
  @postit=Post.find_by id: params[:id]


end
  def create
    @user = User.new params.require(:user).permit(:email, :password, :password_confirmation)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
    flash.now[:alert] = "Your email/password combination does NOT work!"
     render :new
    end
  end

  def follow
    user = User.find params[:id]
    @current_user.follow user
      redirect_to dashboard_path, notice: "Following #{user.email}"
  end

  def delete
    user = User.find params[:id]
    @current_user.stop_following user
      redirect_to dashboard_path, notice: "Unfollow #{user.email}"
  end


end
