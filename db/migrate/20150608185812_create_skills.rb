class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :title
      t.text :description
      t.string :hash_tag
    end
  end
end
