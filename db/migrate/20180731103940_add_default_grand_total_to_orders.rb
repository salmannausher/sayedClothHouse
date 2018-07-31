class AddDefaultGrandTotalToOrders < ActiveRecord::Migration[5.0]
  def change
  	change_column :orders, :grand_total, :integer, default: 0, null: false 
  	#change_column_default(:orders, :grand_total, 0)
  end
end
