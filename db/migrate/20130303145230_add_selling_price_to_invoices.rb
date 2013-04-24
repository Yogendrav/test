class AddSellingPriceToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :selling_price, :float
  end
end
