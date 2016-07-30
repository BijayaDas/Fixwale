class CreateWorkDays < ActiveRecord::Migration
  def change
    create_table :work_days do |t|
    	t.integer :day, default: 0, limit: 1
    	t.string :start_time
    	t.string :end_date
    end
  end
end
