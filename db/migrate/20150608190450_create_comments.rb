class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :service_provider
      t.references :user
      t.text :description
      t.timestamps
    end
  end
end
