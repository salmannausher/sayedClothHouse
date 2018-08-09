class Product < ApplicationRecord
  has_many :line_items
  has_many :stocks
  belongs_to :vendor
  accepts_nested_attributes_for :stocks
  PRODUCT_NAMES = ['Small Latha','Moonmist-17','Airgon','Paragon-18','Giza-Lawn 92','Magnu-17','Sensa-17','Mustang-18','Summer Dream-18','Oak tree-18','Almas-18','Nafees cotton-18']
  before_create :set_sale_price
  after_create :genrate_barcode
 # validate :stock_limit
  # after_save :calculate_meters,:create_stock

  def profit_percentage=(new_name)
   write_attribute(:profit_percentage, new_name.to_i)
  end
  def create_stock
    if self.id_changed?
      self.stocks.create(than: self.than, gazana_per_than: self.gazan_per_than, meter: self.calculate_meters )
    else
      first_stock =self.stocks.first
      if first_stock.blank?
        self.stocks.create(than: self.than, gazana_per_than: self.gazan_per_than, meter: self.meter )
      else
      self.stocks.first.update( than: self.than, gazana_per_than: self.gazan_per_than, meter: self.meter)
      end
    end
  end

  def set_sale_price
    self.sale_price = product_sale_price
  end

  def product_sale_price
    profit = rate * profit_percentage/100
    pro_sale_price = rate + profit
  end

  def calculate_meters
    product_meters = than * gazan_per_than
    update_column(:meter, product_meters)
  end

  def calculate_stock
    stocks.sum(:meter)
  end

  # def available_stock
  #   stocks.sum(:meter)
  # end

  # def stock_limit
  #   if available_stock <= 0
  #     errors.add(:Than, 'Product Out of stock')
  #   end
  # end
  def self.out_of_stock
    Product.all.map{|a| a.calculate_stock <= 0 ? a.id : ''}
  end

  def genrate_barcode
    @barcode = Barby::Code128B.new(self.sale_price)
      @barcode_for_html = Barby::HtmlOutputter.new(@barcode)
  end

end
