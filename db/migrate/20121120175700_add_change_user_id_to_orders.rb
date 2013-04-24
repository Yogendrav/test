class AddChangeUserIdToOrders < ActiveRecord::Migration
  def change
  	add_column :orders, :change_user_id, :integer
  end
end
