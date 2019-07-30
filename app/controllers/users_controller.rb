class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".welcome"
      redirect_to root_path
    else
      flash[:danger] = t ".create_fail"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :email, :full_name, :user_name, :role,
      :password, :password_confirmation, :avatar
  end
end
