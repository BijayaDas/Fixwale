class CreatePreVarifiedResources < ActiveRecord::Migration[5.0]
  def change
    create_table :pre_varified_resources do |t|
      t.integer :expert_level
      t.string :skill_sets
      t.string :years_experience
      t.string :designation
      t.integer :budget
      t.string :need_before

      t.timestamps
    end
  end
end
