class LineItem < ApplicationRecord
	belongs_to :product , optional: true
	belongs_to :order, optional: true
	before_save :line_total
	delegate :product_type, to: :product, allow_nil: true

	def line_total 
		self.total_price = calculate_meters*price_per_meter
	end

	def calculate_meters
		self.meter = than * gaz_per_than
	end

	def product
  	Product.with_deleted.find(product_id)
	end
end
