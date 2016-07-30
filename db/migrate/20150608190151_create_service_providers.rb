class CreateServiceProviders < ActiveRecord::Migration
  def change
    create_table :service_providers do |t|
      t.string :name
      t.text :description
      t.string :notice_period
      t.string :attached_resume
      t.string :portfolio_website
      t.string :linkedin_url
      t.boolean :actively_looking
      t.references :domain
      t.references :user
      t.timestamps
    end
  end
end
