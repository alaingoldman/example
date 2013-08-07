class RenameInvitationColumnName < ActiveRecord::Migration
  def up
  	rename_column :invitations, :sent_by, :user_id
  end

  def down
  	rename_column :invitations, :user_id, :sent_by
  end
end
