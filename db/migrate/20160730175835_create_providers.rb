class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :title
      t.text :description
      t.string :notice_period
      t.string :work_time_preference
      t.string :work_day_preference
      t.string :attached_resume
      t.string :portfolio_website
      t.string :linkedin_url
      t.integer :actively_looking, limit: 1
      t.references :category
      t.references :user
      t.timestamps
    end
  end
end
