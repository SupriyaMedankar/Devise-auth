class OmniauthCallbacksController < Devise::OmniauthCallbacksController
	skip_before_action :verify_authenticity_token
	def all
		user = User.from_omniauth(request.env["omniauth.auth"])
		if user.persisted?
			sign_in_and_redirect user, notice: "Signed in!"
		else
			#session[""]
			redirect_to new_user_registration_url
		end

	end
	alias_method :google_oauth2, :all
end
