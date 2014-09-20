class User < ActiveRecord::Base

  attr_accessor :password
  
  validates_presence_of :password, on: :create
  
  before_save :encrypt_password
  before_update :encrypt_password

  has_many :ads

  def self.authenticate(user_name, password)
    user = find_by(email: user_name)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    unless (password_hash && password_salt) && !password
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
