class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.integer :index
      t.float :duration
      t.integer :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
