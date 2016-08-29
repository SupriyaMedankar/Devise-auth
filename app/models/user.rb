class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,:omniauth_providers => [:google_oauth2]

#attr_accessible :email, :password, :password_confirmatin, :remember_me, :username

def self.from_omniauth(auth)
	where(auth.slice(:provider, :uid)).first_or_create do |user|
		user.provider = auth.provider
		user.uid = auth.uid
		user.username = auth.info.nickname
	end
end

end
