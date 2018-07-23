class LineItem < ApplicationRecord
	belongs_to :product , optional: true
	belongs_to :order, optional: true
	before_create :line_total

	def line_total 
		self.total_price = meter*price_per_meter
	end
end
