class Light < ActiveRecord::Base
	belongs_to :customer, dependent: :destroy

	validates :amount, presence: true, numericality: { only_integers: true }
	validates :type, presence: true
	validates :colors, presence: true
	validates :amount_replaced, absence: true
	                            if absence: false
	                              numericality: { only_integers: true}
	                            end
	validates :our_stringer, inclusion: { in: [true, false] }
end
