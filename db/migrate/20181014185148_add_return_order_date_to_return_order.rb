class AddReturnOrderDateToReturnOrder < ActiveRecord::Migration[5.0]
  def change
  	add_column :orders, :reurn_order_date, :date
  end
end
