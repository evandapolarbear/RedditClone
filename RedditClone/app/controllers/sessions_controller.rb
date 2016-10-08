class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params[:email], session_params[:password])
    login(@user)

    redirect_to root_url
  end

  def destroy
    logout
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
