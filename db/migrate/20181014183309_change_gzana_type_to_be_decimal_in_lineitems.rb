class ChangeGzanaTypeToBeDecimalInLineitems < ActiveRecord::Migration[5.0]
  def change
  	change_column :line_items, :than, :decimal
  	change_column :line_items, :gaz_per_than, :decimal
  	change_column :line_items, :meter, :decimal
  end
end
