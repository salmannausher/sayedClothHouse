class AddGazanaNumberToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :gazana_num, :integer
  end
end
