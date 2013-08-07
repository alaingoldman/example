class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :email
      t.boolean :activated

      t.timestamps
    end
  end
end
