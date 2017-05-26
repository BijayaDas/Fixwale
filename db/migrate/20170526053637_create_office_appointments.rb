class CreateOfficeAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :office_appointments do |t|
      t.string :description
      t.stringn :date
      t.string :time
      t.integer :hours
      t.integer :payment_due
      t.boolean :active

      t.timestamps
    end
  end
end
