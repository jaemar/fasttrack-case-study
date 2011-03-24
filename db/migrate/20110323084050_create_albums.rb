class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :name
      t.references :user
      t.boolean :enabled, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
