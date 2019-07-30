class PasswordResetsController < ApplicationController
  before_action :get_user, only: %i(update edit)
  before_action :valid_user, only: %i(update edit)
  before_action :check_expiration, only: %i(update edit)

  def new
  end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      UserMailer.password_reset(@user).deliver_now
      redirect_to root_path, warning: "Email sent with password reset instructions"
    else
      render :new, danger: "Email address not found"
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      log_in @user
      redirect_to @user, success: "Password has been reset."
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

  def get_user
    @user = User.find_by email: params[:email]
  end

  # Confirms a valid user.
  def valid_user
    unless @user&.activated? && @user.authenticated?(:reset, params[:id])
      redirect_to root_path
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      redirect_to new_password_reset_path, danger: "Password reset has expired."
    end
  end
end
