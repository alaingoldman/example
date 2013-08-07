class RemoveSentAtFromInvitation < ActiveRecord::Migration
  def self.up
  	remove_column :invitations, :sent_at
  end

  def self.down
  	add_column :invitations, :sent_at
  end
end