class AddShipPriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ship_price, :integer
  end
end
