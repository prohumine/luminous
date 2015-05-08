class Customer < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	has_many :lights

	before_save :email_downcase

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: true

	validates :phone, presence: true

	validates :address, presence: true

	def email_downcase
		self.email = email.downcase
	end
end