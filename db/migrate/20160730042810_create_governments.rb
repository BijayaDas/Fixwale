class CreateGovernments < ActiveRecord::Migration[5.0]
  def change
    create_table :governments do |t|

      t.timestamps
    end
  end
end
