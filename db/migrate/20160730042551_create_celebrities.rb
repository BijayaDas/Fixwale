class CreateCelebrities < ActiveRecord::Migration[5.0]
  def change
    create_table :celebrities do |t|

      t.timestamps
    end
  end
end
