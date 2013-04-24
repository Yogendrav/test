class AddContractIdToSanitations < ActiveRecord::Migration
  def change
    add_column :sanitations, :contract_id, :integer
  end
end
