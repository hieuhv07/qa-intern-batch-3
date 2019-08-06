class Admin::BaseController < ApplicationController
  layout "admin"

  before_action :logged_in_user, :is_admin

  private

  def is_admin
    return if current_user.admin?
    raise MyCustomException
  end
end
