class AddPricePercentageToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :price_percentage, :float
  end
end
