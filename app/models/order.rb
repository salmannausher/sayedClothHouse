class Order < ApplicationRecord
  default_scope  {order('created_at asc')}
  belongs_to :client, optional: true
  has_many :stocks
  has_many :line_items 
  has_one :payment, dependent: :destroy
  accepts_nested_attributes_for :line_items
  accepts_nested_attributes_for :stocks
  
  after_save :order_total,:create_stock,:create_order_payment

  def order_total
    # if self.line_items.present?
      order_total = self.line_items.sum(:total_price) + self.shipping_charges.to_i
      order_total = order_total*(100-self.discount)/100 if self.discount.present?
    # else
    #   last_stock = self.stocks.last
    #   order_total = last_stock.product.sale_price*last_stock.meter
    # end
    self.update_column(:grand_total,order_total )
  end

  def discount_price
    order_total = self.line_items.sum(:total_price) + self.shipping_charges.to_i
    discount_price = order_total - order_total*(100-self.discount)/100
  end

  

  def total_without_cargo
    order_total = self.line_items.sum(:total_price)
  end

  def create_stock
    self.line_items.each do |item|
      self.stocks.create(product_id: item.product_id,than: item.than, gazana_per_than: item.gaz_per_than )
    end
  end

  def create_order_payment
    # if self.id_changed?
    a = 1
    payment_type = "credit"
    order_description = "Order Payment"
    if self.order_type == "return_invoice"
      a = -1
      payment_type = "debit"
      order_description = "Return Invoice Payment"
    end
    if self.id_changed?
      self.create_payment(client_id: self.client.id, amount: a*(self.grand_total), payment_type: payment_type, description: order_description)
    else
      self.payment.update(client_id: self.client.id, amount: a*(self.grand_total), payment_type: payment_type, description: order_description)
    end
  end

  

  # def stock_limit
  #   self.line_items.each do |item|
  #     if item.meter >= item.product.available_stock
  #       errors.add(:grand_total, 'Product Out of stock')
  #     end
  #   end
  # end

end
