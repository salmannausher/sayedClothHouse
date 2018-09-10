class ChangeDataTypeToDoubleInStocks < ActiveRecord::Migration[5.0]
  def change
  	change_column :stocks, :than, :decimal
  	change_column :stocks, :gazana_per_than, :decimal
  end
end
