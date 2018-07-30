class LineItem < ApplicationRecord
	belongs_to :product , optional: true
	belongs_to :order, optional: true
	before_create :line_total

	def line_total 
		self.total_price = calculate_meters*price_per_meter
	end

	def calculate_meters
		self.meter = than * gaz_per_than
	end

	
end
