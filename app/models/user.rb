class User < ApplicationRecord

  has_secure_password

  validates :name, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :email, presence: true
  validates :password, presence: true, length: {minimum: 5}
  validates :password_confirmation, presence: true


  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase) 
    if user && user.authenticate(password)
      user
    else
      nil
    end

  end


end 
