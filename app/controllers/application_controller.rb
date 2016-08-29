class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

   private
   	def user_exist
		redirect_to root_path, alert:"Already logged in" unless current_user.nil?
	end

  def current_user
    User.where(id: session[:user_id]).first
  end
  helper_method :current_user
end


