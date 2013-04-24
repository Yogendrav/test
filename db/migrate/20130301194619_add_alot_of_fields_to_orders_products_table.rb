class AddAlotOfFieldsToOrdersProductsTable < ActiveRecord::Migration
  def change
    add_column :orders_products, :quantity, :integer
    add_column :orders_products, :price, :float
    add_column :orders_products, :difference_price, :float
    remove_column :orders, :quantity
    remove_column :orders, :difference_price
  end
end
