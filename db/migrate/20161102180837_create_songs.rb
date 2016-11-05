class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
