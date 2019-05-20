class CreateAudiobooks < ActiveRecord::Migration[5.2]
  def change
    create_table :audiobooks do |t|
      t.string :name
      t.string :author
      t.integer :timestamp
      t.integer :user_id

      t.timestamps
    end
  end
end
