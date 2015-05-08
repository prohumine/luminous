class Light < ActiveRecord::Base
	belongs_to :customer, dependent: :destroy

	validates :amount, presence: true, numericality: { only_integers: true }
	validates :light_type, presence: true
	validates :colors, presence: true
	validates :amount_replaced, inclusion: { in: 0..100 }
	validates :our_stringer, inclusion: { in: [true, false] }

end