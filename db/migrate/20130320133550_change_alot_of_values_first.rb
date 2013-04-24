class ChangeAlotOfValuesFirst < ActiveRecord::Migration
  def change
    change_column :contracts, :selling_price, :float
    change_column :contracts, :difference_price, :float
    change_column :products, :purchase_price, :float
  end
end
