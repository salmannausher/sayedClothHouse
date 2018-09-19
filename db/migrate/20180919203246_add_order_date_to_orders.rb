class AddOrderDateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :order_date, :date
  end
end
