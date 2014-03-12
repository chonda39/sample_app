class User < ActiveRecord::Base
	#a block to the before_save callback and sets the user’s email 
	#address to a lower-case version of its current value using 
	#the downcase string method.
  #before_save { self.email = email.downcase }	--this is same things with below
  before_save { email.downcase! }	
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },	
  			        uniqueness:{ case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }			        
end
