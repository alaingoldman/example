class AddDefaultValueToRequestAccepted < ActiveRecord::Migration
def up
    change_column :requests, :activated, :boolean, :default => false
end

def down
    change_column :requests, :activated, :boolean, :default => nil
end
end
