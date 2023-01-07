class User < ApplicationRecord
  
  has_secure_password
  
  validates_uniqueness_of :username

  validates_presence_of :password, :on => create

  before_create { generate_token(:auth_token) }

  has_one :shopping_cart

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
