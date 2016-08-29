class User < ActiveRecord::Base

    before_save :encrypt_password
    after_save :clear_password

	 attr_accessor :password


  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  validates :username, presence: true, uniqueness: true, length: 3..20
  validates :email, presence: true, :uniqueness => true, format: EMAIL_REGEX
  validates :password, confirmation: true #, length: 6..20 #password_confirmation attr




def encrypt_password
  if password.present?
    self.salt = BCrypt::Engine.generate_salt
    self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
  end
end

def clear_password
  self.password = nil
end

def generate_token(column)
    #begin
    self[column] = SecureRandom.urlsafe_base64
  #end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    update_attribute(:password_reset_sent_at, Time.now)
    # self.password_reset_sent_at = Time.zone.now #+ 30
    save!
    UserMailer.password_reset(self).deliver
  end

end
