class Admin::UsersController < Admin::BaseController
  before_action :load_user, only: :update

  def index
    @users = User.all.order("created_at DESC")
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

  def update
    @user.role = params[:value]
    respond_to do |format|
      if @user.save
        format.js { flash.now[:success] = t "messages.success.admin_user.update" }
      else
        format.js { flash.now[:danger] = t "messages.failed.admin_user.update" }
      end
      format.html
    end
  end

  private

  def user_params
    params.require(:user).permit :email, :full_name, :user_name, :role,
      :password, :password_confirmation, :avatar
  end

  def load_user
    return if @user = User.find_by(id: params[:id])
    respond_to do |format|
      format.js { render :js => "window.location.href = '#{admin_users_path}'"
        flash[:danger] = t "messages.failed.admin_user.not_find"
      }
    end
  end
end
