class AddUserIdToSuppliers < ActiveRecord::Migration
  def change
  	add_column :suppliers, :user_id, :integer
  end
end
