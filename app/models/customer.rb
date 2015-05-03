class Customer < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	has many :lights

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 },
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: true

	validates :phone, presence: true, length: { is: 10 },
	                  numericality: { only_integer: true }

	validates :address, presence: true,
end
