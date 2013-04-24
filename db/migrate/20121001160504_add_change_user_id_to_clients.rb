class AddChangeUserIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :change_user_id, :integer
  end
end
