class AddIndexToRequestEmails < ActiveRecord::Migration
  def change
  	add_index :requests, :email, unique: true
  end
end
