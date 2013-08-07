class AddShipMethodToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ship_method, :string
  end
end
