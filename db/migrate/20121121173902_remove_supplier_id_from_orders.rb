class RemoveSupplierIdFromOrders < ActiveRecord::Migration
  def up
  	remove_column :orders, :supplier_id
  end

  def down
  	add_column :orders, :supplier_id, :integer
  end
end
