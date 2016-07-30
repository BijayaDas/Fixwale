class AddAvatarToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :avatar, :string
  end
end
