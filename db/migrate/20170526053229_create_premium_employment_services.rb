class CreatePremiumEmploymentServices < ActiveRecord::Migration[5.0]
  def change
    create_table :premium_employment_services do |t|
      t.integer :attempts_limit
      t.integer :current_attempt
      t.boolean :placed
      t.string :placed_in
      t.integer :paid_ammount
      t.integer :offered_ctc
      t.boolean :active

      t.timestamps
    end
  end
end
