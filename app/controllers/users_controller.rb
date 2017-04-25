class UsersController < ApplicationController

  def welcome

  end

  def new
    @user = User.new
  end

  def show
  end

  def myprofile
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've succesfully completed the most annoying task!"
      redirect_to root_path
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
