class ApplicationController < ActionController::Base
	protect_from_forgery

private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def logged!
		unauthorize login_url if current_user.nil?
	end

	def guest!
		unauthorize root_url unless current_user.nil?
	end

	def unauthorize(url)
		redirect_to url, alert: "Not authorized"
	end
end
