class AddMobileToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :mobile, :integer, limit: 5
  end
end
