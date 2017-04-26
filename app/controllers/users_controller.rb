class UsersController < ApplicationController

  def welcome

  end

  def new
    @user = User.new
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
      if @user.update(user_params)
        redirect_to profile_path, notice: 'Account was successfully updated.'
      else
        render :edit
      end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You've succesfully completed the most annoying task!"
      redirect_to profile_path
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
