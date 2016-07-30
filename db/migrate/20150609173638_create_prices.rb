class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.integer :amount
      t.integer :price_type, default: 0, limit: 1
      t.references :provider, index: :true
      t.timestamps
    end
  end
end
