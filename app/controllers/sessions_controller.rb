class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to root_path
    end
  end
end
