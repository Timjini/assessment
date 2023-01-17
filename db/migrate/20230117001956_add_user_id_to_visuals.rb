class AddUserIdToVisuals < ActiveRecord::Migration[7.0]
  def change
    add_column :visuals, :user_id, :integer
    add_index :visuals, :user_id
  end
end
