class Stock < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :order, optional: true
  validates :than,:gazana_per_than, presence: true 
  before_save :calculate_meters
  # validates :meter, numericality: { greater_than_or_equal_to: 1 }
  def calculate_meters
    m = than * gazana_per_than
    if self.order.present?
      if order.order_type == "order"
        self.meter = self.order.present? ? m*-1 : m
      else
        self.meter = self.order.present? ? m : m
      end
    end
  end
end

