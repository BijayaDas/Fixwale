class CreateJoinTableServiceProviderSkill < ActiveRecord::Migration
  def change
    create_join_table :service_providers, :skills do |t|
      t.decimal :experience, :precision => 2 #in years
      t.references :service_provider
      t.references :skill

    end
  end
end
