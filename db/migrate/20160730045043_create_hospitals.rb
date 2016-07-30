class CreateHospitals < ActiveRecord::Migration[5.0]
  def change
    create_table :hospitals do |t|
    	
		t.references :user
		t.timestamps
    end
  end
end
