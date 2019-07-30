class SessionsController < ApplicationController
	def new; end

	def create
		user = User.find_by("username = :username OR email = :username", {username: params[:username_or_email]})
		if user && user.authenticate(params[:session][:password])
			if user.activated?
				log_in user
				params[:session][:remember_me] == "1" ? remember(user) : forget(user)
				flash[:success] = "ok"
				redirect_to root_path
			else
				flash[:danger] = "loi"
				redirect_to root_path
			end
		else
			flash.now[:danger] = "loi"
			render :new
		end
	end

	def destroy
		log_out
		redirect_to root_path
	end
end