class Order < ApplicationRecord
	belongs_to :client, optional: true
	has_many :line_items 
	accepts_nested_attributes_for :line_items
	after_save :order_total

	def order_total
		order_total = self.line_items.sum(:total_price) + self.shipping_charges.to_i
		self.update_column(:grand_total,order_total )
	end

	def total_without_cargo
		order_total = self.line_items.sum(:total_price)
	end
end
