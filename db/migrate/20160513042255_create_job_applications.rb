class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
		t.string :expected_amount
		t.integer :status, limit: 1
		t.text :cover_letter
		t.references :job, index: true
		t.references :service_provider, index: true
		t.timestamps 
    end
  end
end
