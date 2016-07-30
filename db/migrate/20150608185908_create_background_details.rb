class CreateBackgroundDetails < ActiveRecord::Migration
  def change
    create_table :background_details do |t|
      t.integer :verification_status
      t.text :document_description
      t.integer :document_type
      t.references :service_provider, index: true
      t.references :address, index: true
      t.timestamps
    end
  end
end
