class UsersController < ApplicationController
  before_action :logged_in_user, only: :index

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".welcome"
      redirect_to root_path
    else
      respond_to do |format|
        format.js
      end
    end
  end

  private

  def user_params
    params.require(:user).permit :email, :full_name, :user_name, :role,
    :password, :password_confirmation, :avatar
  end
end
