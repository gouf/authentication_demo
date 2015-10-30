class User < ActiveRecord::Base
  before_save :encrypt_password

  def encrypt_password
    require 'digest'
    self.password = Digest::SHA256.hexdigest(password)
  end
end
