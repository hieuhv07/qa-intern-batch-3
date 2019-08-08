class Admin::UsersController < Admin::BaseController
  before_action :load_user, only: [:update, :destroy]
  before_action :not_delete_current_user, :admin_user, only: :destroy

  def index
    @users = User.all.order("created_at DESC")
  end

  def create
    @user = User.new user_params
    @user.activated =  true
    @user.activated_at = Time.zone.now
    if @user.save
      flash[:success] = t "messages.success.admin_user.create"
    else
      flash[:danger] = t "messages.failed.admin_user.create"
    end
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if current_user?(@user)
        format.js { render :js => "window.location.href = '#{admin_users_path}'"
          flash[:danger] = t "messages.failed.admin_user.not_set_role"
        }
      else
        @user.role = @user.admin? ? :user : :admin
        if @user.save
          format.js { flash.now[:success] = t "messages.success.admin_user.update" }
        else
          format.js { flash.now[:danger] = t "messages.failed.admin_user.update" }
        end
      end
    end
  end

  def destroy
    if @user.user? && @user.destroy
      flash[:success] = t "messages.success.admin_user.delete"
    else
      flash[:danger] = t "messages.failed.admin_user.delete"
    end
    redirect_to admin_users_path
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

  def admin_user
    return if current_user.admin?
    flash[:danger] = t "messages.failed.admin_user.permit"
    redirect_to root_path
  end

  def not_delete_current_user
    return unless current_user?(@user)
    flash[:danger] = t "messages.failed.admin_user.delete_current_user"
    redirect_to admin_users_path
  end
end
