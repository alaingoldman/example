class RenameSendToToEmailInInvitations < ActiveRecord::Migration
  def up
  	rename_column :invitations, :sent_to, :email
  end

  def down
  	rename_column :invitations, :email, :sent_to
  end
end