class AddOrderEndDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :order_end_date, :date
  end
end
