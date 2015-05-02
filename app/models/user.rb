class User < ActiveRecord::Base
	has_many :customers
	has_many :lights, through: :customers
end
