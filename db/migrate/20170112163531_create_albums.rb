class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums, id: :uuid do |t|
      t.timestamps

      t.string :title, null: false
      t.string :year
      t.references :artist, type: :uuid, foreign_key: true, null: false
    end

    add_index :albums, [:artist_id, :title], unique: true
  end
end
