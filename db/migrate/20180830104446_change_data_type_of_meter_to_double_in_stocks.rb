class ChangeDataTypeOfMeterToDoubleInStocks < ActiveRecord::Migration[5.0]
  def change
  	change_column :stocks, :meter, :decimal
  end
end
