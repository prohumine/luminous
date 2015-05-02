class Customer < ActiveRecord::Base
	belongs_to :user, dependent: :destroy
	has many :lights
end
