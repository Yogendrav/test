class AddChangeUserIdToSuppliers < ActiveRecord::Migration
  def change
  	add_column :suppliers, :change_user_id, :integer
  end
end
