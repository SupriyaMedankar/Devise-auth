class LoginsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end

  private
    def login_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end
end
