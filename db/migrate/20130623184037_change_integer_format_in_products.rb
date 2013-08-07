class ChangeIntegerFormatInProducts < ActiveRecord::Migration
  def self.up
  	change_column :products, :price, :decimal
  	change_column :products, :ship_price, :decimal

  end

  def self.down
  	change_column :products, :price, :integer
  	change_column :products, :ship_price, :integer
  end
end
