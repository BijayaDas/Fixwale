class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.integer :name #I have used Enum for this field
      t.boolean :read
      t.boolean :write
      t.boolean :speak
      t.integer :fluency_level, default:0, limit: 1
      t.references :service_provider
      t.timestamps 
    end
  end
end
