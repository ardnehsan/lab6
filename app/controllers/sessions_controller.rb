class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:email]
    password = params[:password]

    user = User.find_by email: email
    if user && user.authenticate(password)
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:alert] = "Something is wrong"
      render :new
    end
  end

  def delete
    session.delete :user_id
    redirect_to root_path, notice: "Come Back Soon!"
  end
end
