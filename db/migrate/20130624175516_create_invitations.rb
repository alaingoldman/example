class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :sent_by
      t.text :sent_to
      t.date :sent_at
      t.date :accepted_at
      t.text :invite_token

      t.timestamps
    end
  end
end
