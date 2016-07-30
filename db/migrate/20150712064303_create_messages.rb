class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
	  t.integer :parent_id
	  t.text :content
	  t.references :user, index: :true
	  t.references :service_provider, index: :true
      t.timestamps
    end
  end
end
