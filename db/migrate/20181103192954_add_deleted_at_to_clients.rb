class AddDeletedAtToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :deleted_at, :datetime
    add_index :clients, :deleted_at
  end
end
