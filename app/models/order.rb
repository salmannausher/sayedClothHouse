class Order < ApplicationRecord
	belongs_to :client, optional: true
	has_many :line_items 
	accepts_nested_attributes_for :line_items
	before_create :order_total

	def order_total
		order_total = self.line_items.sum(:total_price)
	end
end
