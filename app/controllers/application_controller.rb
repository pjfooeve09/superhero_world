class ApplicationController < ActionController::Base

	helper_method :redirect_if_not_logged_in
	helper_method :current_user

	private
	
	def logged_in?
		!!current_user
	end

	def current_user
		User.find_by(id: session[:user_id])
	end

	def log_in(user)
		session[:user_id] = user.id
	end

	def redirect_if_not_logged_in
		if !logged_in?
			redirect_to login_path
		end
	end

	def new_user_or_go_to_user_path
		 if logged_in? 
			redirect_to user_path(current_user)
		 else @user = User.new
            render :layout => false 
		end
	end

end