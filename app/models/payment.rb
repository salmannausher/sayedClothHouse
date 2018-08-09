class Payment < ApplicationRecord
	belongs_to :client, optional: true
	belongs_to :order, optional: true
end
