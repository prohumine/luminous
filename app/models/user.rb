class User < ActiveRecord::Base
	attr_accessor :name, :email

	has_many :customers
	has_many :lights, through: :customers

	before_save :email_downcase

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }
	
	has_secure_password

	def email_downcase
		self.email = email.downcase
	end
end
