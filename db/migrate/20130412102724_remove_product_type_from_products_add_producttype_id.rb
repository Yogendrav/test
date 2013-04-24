class RemoveProductTypeFromProductsAddProducttypeId < ActiveRecord::Migration
  def up
    remove_column :products, :product_type
    add_column :products, :producttype_id, :integer
  end

  def down
    add_column :products, :client_id, :integer
  end
end
