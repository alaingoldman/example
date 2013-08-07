class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :debit_uri
      t.string :credit_uri
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :product_id
      t.decimal :price
      t.decimal :ship_price
      t.string :ship_method

      t.timestamps
    end
  end
end
