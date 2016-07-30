class CreateEnquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :enquiries do |t|
	  t.string :title
	  t.string :budget
      t.text :job_description
      t.string :mobile
      t.string :email
      t.text :contact_details
      t.integer :max_applications
      t.string :deadline
      t.references :category, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
