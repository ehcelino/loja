class User < ApplicationRecord
  
  has_secure_password validations: false
  
  validates_uniqueness_of :username

  # validates_presence_of :password, :on => create

  before_create { generate_token(:auth_token) }

  has_one :shopping_cart

  validates :username, presence: {message: "não pode estar em branco."}, length: { in: 4..14, message: 'tem que ter entre 4 a 14 caracteres.' }, uniqueness: {message: 'já em uso.'}
  validates :email, presence: {message: "não pode estar em branco."}, uniqueness: {message: 'já em uso.'}
  validates :password, presence: {message: "não pode estar em branco."}, length: { in: 3..6, message: 'tem que ter entre 3 a 6 caracteres.' }

  HUMANIZED_ATTRIBUTES = {
  :email => "Email",
  :password => "Senha", # don't include column name in error
  :username => "Usuário",
  }

  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  # attr_accessor :admin

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
