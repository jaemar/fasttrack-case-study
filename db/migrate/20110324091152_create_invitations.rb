class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.references :user
      t.references :invited_user
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
