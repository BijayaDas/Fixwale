class CreateInstaBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :insta_bookings do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :description
      t.string :date
      t.string :time
      t.integer :hours
      t.integer :payment_due
      t.boolean :active

      t.timestamps
    end
  end
end
