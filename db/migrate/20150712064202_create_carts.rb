class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.text :description
      t.integer :mobile
      t.integer :reporting_time
      t.date :start_date
      t.date :end_date
      t.integer :hours
      t.boolean :repeat
      t.integer :total_amount
      t.integer :status, default: 0, limit: 1
      t.integer :booking_type, default: 0, limit: 1
      t.integer :service_site, default: 0, limit: 1
      t.references :user
      t.references :address
      t.references :service_provider
    end
  end
end
