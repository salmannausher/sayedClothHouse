class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.integer :line_item_id
      t.integer :grand_total
      t.integer :shipping_charges

      t.timestamps
    end
  end
end
