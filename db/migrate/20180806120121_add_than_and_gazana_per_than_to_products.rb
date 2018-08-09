class AddThanAndGazanaPerThanToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :than, :integer
    add_column :products, :gazan_per_than, :integer
  end
end
