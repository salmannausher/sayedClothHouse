class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.integer :product_id
      t.integer :than
      t.integer :gazana_per_than
      t.integer :meter
      t.integer :order_id

      t.timestamps
    end
  end
end
