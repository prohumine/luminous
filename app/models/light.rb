class Light < ActiveRecord::Base
	belongs_to :customer, dependent: :destroy

	validates :amount, presence: true, numericality: { only_integers: true }
	validates :light_type, presence: true, length: { maximum: 255 }
	validates :colors, presence: true, length: { maximum: 255 }
	validates :amount_replaced, inclusion: { in: 0..100 }
	validates :our_stringer, inclusion: { in: [true, false] }
end