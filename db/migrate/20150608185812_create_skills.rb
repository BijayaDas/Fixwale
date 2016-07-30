class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.text :description
      t.string :icon
      t.string :hash_tag
    end
  end
end
