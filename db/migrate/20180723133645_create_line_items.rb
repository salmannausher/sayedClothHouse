class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.float :size
      t.integer :than
      t.string :item_name
      t.integer :gaz_per_than
      t.integer :meter
      t.integer :price_per_meter
      t.integer :total_price
      t.integer :product_id
      t.integer :order_id

      t.timestamps
    end
  end
end
