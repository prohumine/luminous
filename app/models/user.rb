class User < ActiveRecord::Base
	has_many :customers
	has_many :lights, through: :customers

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: { case_sensitive: false }
	validates :password_digest, presence: true, length: { in: 6..15 }
	
	has_secured_password
end
