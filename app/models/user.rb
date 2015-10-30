class User < ActiveRecord::Base
  before_save :encrypt_password

  def encrypt_password
    require 'digest'
    self.password = Digest::SHA256.hexdigest(password)
  end

  def authenticate(string)
    require 'digest'
    input_password = Digest::SHA256.hexdigest(string)
    password.eql?(input_password)
  end
end
