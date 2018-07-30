class Product < ApplicationRecord
	has_many :line_items
	belongs_to :vendor
	PRODUCT_NAMES = ['Small Latha','Moonmist-17','Airgon','Paragon-18','Giza-Lawn 92','Magnu-17','Sensa-17','Mustang-18','Summer Dream-18','Oak tree-18','Almas-18','Nafees cotton-18']
	before_create :set_sale_price

	def set_sale_price
		self.sale_price = product_sale_price
	end

	def product_sale_price
		profit = rate * profit_percentage/100
		pro_sale_price = rate + profit
	end
end
