class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all.order(:id)
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "messages.success.admin_user.create"
    end
    respond_to do |format|
      format.js
    end
  end

  private

  def user_params
    params.require(:user).permit :email, :full_name, :user_name, :role,
      :password, :password_confirmation, :avatar
  end
end
