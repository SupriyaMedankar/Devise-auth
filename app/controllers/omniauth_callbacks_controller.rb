class OmniauthCallbacksController < Devise::OmniauthCallbacksController
       # before_action :user_valid?  only[:google_oauth2]
	def google_oauth2
    # if user_valid?(request.env["omniauth.auth"])
		   @user = User.from_omniauth(request.env["omniauth.auth"])
	     	if @user.persisted?
	     		session[:username] = @user.username
			   sign_in_and_redirect @user, notice: "Signed in!"
	       else
	      	session["devise.google_data"] = request.env["omniauth.auth"]
          redirect_to root_path
        end
      # else
      # 	redirect_to root_path, notice: "You should login with kiprosh id"
      # end
  end

private

  def user_valid?(auth)
  	#  p auth.extra.raw_info.hd
      auth.extra.raw_info.hd == "kiprosh.com"
  end
end
