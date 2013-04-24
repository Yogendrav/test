class AddClientTypeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :client_type, :integer
  end
end
