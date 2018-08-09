class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :client_id
      t.integer :order_id
      t.integer :amount
      t.string :payment_type
      t.string :description

      t.timestamps
    end
  end
end
