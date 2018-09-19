class AddNumberToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :number, :string
  end
end
