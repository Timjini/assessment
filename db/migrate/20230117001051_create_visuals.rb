class CreateVisuals < ActiveRecord::Migration[7.0]
  def change
    create_table :visuals do |t|
      t.string :image

      t.timestamps
    end
  end
end
