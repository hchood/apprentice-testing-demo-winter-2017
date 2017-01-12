class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists, id: :uuid do |t|
      t.timestamps

      t.string :name, null: false
    end

    add_index :artists, :name, unique: true
  end
end
