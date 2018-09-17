class AddRemainingAmountToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :remaining_amount, :integer
  end
end
