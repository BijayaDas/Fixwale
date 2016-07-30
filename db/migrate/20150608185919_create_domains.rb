class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
	  t.string :name
      t.text :description
      t.string :icon
      t.integer :parent_id
      t.timestamps
    end
  end
end
