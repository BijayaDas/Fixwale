class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :headline
      t.text :job_description
      t.text :contact_details
      t.integer :max_applications
      t.date :expiration_date
      t.references :domain, index: true
      t.references :user, index: true
      t.timestamps 
    end
  end
end
