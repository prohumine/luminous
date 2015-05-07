class User < ActiveRecord::Base
	has_many :customers
	has_many :lights, through: :customers

	before_save :email_downcase, on: :create

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }
	
	has_secure_password

	def email_downcase
		self.email = email.downcase
	end
end
