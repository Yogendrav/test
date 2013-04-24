class AddSupplierIdToPhones < ActiveRecord::Migration
  def change
  	add_column :phones, :supplier_id, :integer
  end
end
