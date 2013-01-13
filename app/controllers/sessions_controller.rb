class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user] = user
      redirect_to root_path, notice: "You are now logged in"
    else
      flash[:error] = "Login failed!"
      render 'new'
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_path, notice: "You have logged out successfully"
  end
end