class Product < ApplicationRecord
	has_many :line_items
	belongs_to :client
	PRODUCT_NAMES = ['Small Latha','Moonmist-17','Airgon','Paragon-18','Giza-Lawn 92','Magnu-17','Sensa-17','Mustang-18','Summer Dream-18','Oak tree-18','Almas-18','Nafees cotton-18']

	def product_sale_price
		profit = rate * profit_percentage/100
		rate + profit
	end
end
