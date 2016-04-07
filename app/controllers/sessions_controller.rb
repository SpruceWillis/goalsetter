class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login_user(@user)
      redirect_to goals_url
    else
      flash[:errors] = "Invalid credentials"
      redirect_to login_url
    end
  end

  def destroy
    logout
    redirect_to login_url
  end
end
