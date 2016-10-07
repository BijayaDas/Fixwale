class AddDeletedAtToEnquiries < ActiveRecord::Migration[5.0]
  def change
    add_column :enquiries, :deleted_at, :datetime
    add_index :enquiries, :deleted_at
  end
end
