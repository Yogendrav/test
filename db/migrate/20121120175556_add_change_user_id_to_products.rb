class AddChangeUserIdToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :change_user_id, :integer
  end
end
