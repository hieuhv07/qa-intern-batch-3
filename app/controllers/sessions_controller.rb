class SessionsController < ApplicationController
  before_action :load_email_user, only: :create

  def new; end

  def create
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_back_or @user
    else
      respond_to do |format|
        format.js { flash.now[:danger] = "Invalid email/password combination" }
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end

  private

  def load_email_user
    @user = User.find_by email: params[:session][:email].downcase
  end
end
