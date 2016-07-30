class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.string :street1
    	t.string :street2
    	t.string :city
      t.string :state
    	t.string :country
      t.integer :pincode
      t.integer :address_type, default: 0, limit: 1
      t.integer :mobile, limit: 5
      t.integer :telephone, limit: 5
      t.references :user, index: :true
    	t.references :service_provider, index: :true
    	t.timestamps
    end
  end
end
