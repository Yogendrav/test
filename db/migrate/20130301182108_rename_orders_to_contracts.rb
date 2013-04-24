class RenameOrdersToContracts < ActiveRecord::Migration
  def change
    rename_table :orders, :contracts
  end
end
