class AddPrimaryKeyIdToInvoices < ActiveRecord::Migration
  def self.up
    add_column :invoices, :id, :primary_key
  end

  def self.down
    remove_column :invoices, :id
  end
end
