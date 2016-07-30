class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.string :expected_amount
	t.integer :status, limit: 1
	t.text :cover_letter
	t.references :enquiry, index: true
	t.references :provider, index: true
      t.timestamps
    end
  end
end
