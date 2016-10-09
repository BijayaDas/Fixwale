class AddDeletedAtToProviders < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :deleted_at, :datetime
    add_index :providers, :deleted_at
  end
end
