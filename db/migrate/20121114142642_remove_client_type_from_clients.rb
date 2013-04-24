class RemoveClientTypeFromClients < ActiveRecord::Migration
  def up
  	remove_column :clients, :client_type
  end

  def down
  	add_column :clients, :client_type, :integer
  end
end
