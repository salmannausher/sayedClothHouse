class AddMetersToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :meter, :integer
  end
end
