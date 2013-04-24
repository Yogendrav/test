class AddClientTypeToClients < ActiveRecord::Migration
  def change
    add_column :clients, :client_type, :integer
  end
end
