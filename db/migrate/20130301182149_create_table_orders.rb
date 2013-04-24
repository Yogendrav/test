class CreateTableOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.integer :quantity
      t.float :difference_price
      t.timestamps
    end
  end
end
