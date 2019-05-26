class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.integer :index
      t.float :duration

      t.timestamps
    end
  end
end
