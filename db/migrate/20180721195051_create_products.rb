class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :client_id
      t.string :name
      t.integer :rate
      t.integer :profit_percentage
      t.integer :sale_price

      t.timestamps
    end
  end
end
