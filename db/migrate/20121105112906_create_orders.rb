class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :client_id
      t.integer :product_id
      t.decimal :selling_price
      t.decimal :difference_price
      t.integer :quantity

      t.timestamps
    end
  end
end
