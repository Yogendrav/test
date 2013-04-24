class AddValidOrderToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :valid_order, :boolean
  end
end
