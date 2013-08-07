class AddEmailActivationTokenToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :email_activation_token, :boolean, :default => false
  end
end
