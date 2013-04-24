class RenameOrdersProductsToInvoices < ActiveRecord::Migration
  def change
    rename_table :orders_products, :invoices
  end
end
