class CreateShares < ActiveRecord::Migration
  def self.up
    create_table :shares do |t|
      t.references :user
      t.references :album

      t.timestamps
    end
  end

  def self.down
    drop_table :shares
  end
end
