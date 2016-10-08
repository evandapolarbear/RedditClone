class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_url
    end

  end

  def show
    @user = User.find(params[:id])
    redirect_to root_url
  end

  def destroy
    @user = User.delete(params[:id])
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
