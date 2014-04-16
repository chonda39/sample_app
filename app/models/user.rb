class User < ActiveRecord::Base
	#a block to the before_save callback and sets the user’s email 
	#address to a lower-case version of its current value using 
	#the downcase string method.
  #before_save { self.email = email.downcase }	--this is same things with below
  has_many :microposts, dependent: :destroy
  before_save { email.downcase! }	
  before_create :create_remember_token
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },	
  			        uniqueness:{ case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }	


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end	        
end
