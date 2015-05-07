class Light < ActiveRecord::Base
	belongs_to :customer, dependent: :destroy

	validates :amount, presence: true, numericality: { only_integers: true }
	validates :type, presence: true
	validates :colors, presence: true
	validates :amount_replaced, inclusion: { in: 1..100 }, allow_nil: true
	validates :our_stringer, inclusion: { in: [true, false] }
end