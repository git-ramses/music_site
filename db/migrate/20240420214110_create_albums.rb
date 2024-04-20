class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.datetime :release_date
      t.string :artist_name
      t.decimal :price, precision: 10, scale: 2
      t.string :summary
      t.string :tags
      t.belongs_to :user

      t.timestamps
    end
  end
end
