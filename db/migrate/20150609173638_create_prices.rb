class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :amount
      t.integer :price_type, default: 0, limit: 1
      t.references :service_provider, index: :true
      t.timestamps
    end
  end
end
