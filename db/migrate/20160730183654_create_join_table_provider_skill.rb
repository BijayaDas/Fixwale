class CreateJoinTableProviderSkill < ActiveRecord::Migration[5.0]
  def change
    create_join_table :providers, :skills do |t|
      t.decimal :experience, :precision => 2 #in years
      t.references :service_provider
      t.references :skill
    end
  end
end
