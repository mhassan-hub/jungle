class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true ,length: { minimum: 3 }
  validates :password_confirmation, presence: true, length: { minimum: 3 }

  def authenticate_with_credentials (email, password)
    good_email = email.downcase.strip
    user = User.find_by_email(good_email)
    user.authenticate(password)
  end
end
