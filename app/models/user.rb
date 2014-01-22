class User < ActiveRecord::Base
	require 'digest/md5'
  attr_accessible  :emal, :first_name, :last_name, :password,:password_confirmation, :role

  before_save :ecrypt_password, :convert_downcase

  validates :first_name, :presence => true, :length => {:minimum => 2, :allow_blank => TRUE}
  validates :last_name, :presence => true, :length => {:minimum => 2, :allow_blank => TRUE}
  validates :password, :presence => true, :length => {:minimum => 6, :allow_blank => TRUE}, :confirmation => TRUE
  validates :password_confirmation, :presence => TRUE
  validates :emal , :presence => TRUE, :uniqueness => TRUE

  def ecrypt_password
  		self.password = Digest::MD5.hexdigest(password)
  end
  def convert_downcase
      self.emal = emal.downcase
  end
  def self.validate_login (email,password)
    user = User.find_by_emal (email.downcase)
    if user && user.password == Digest::MD5.hexdigest(password) 
      user
    else
      nil
    end

  end


end
