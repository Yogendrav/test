class RenameOrderToContractInTableContracts < ActiveRecord::Migration
  def change
    rename_column :contracts, :order_date, :contract_date
    rename_column :contracts, :order_end_date, :contract_end_date
    rename_column :contracts, :valid_order, :valid_contract
  end
end
