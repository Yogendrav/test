class AddPurchasePriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :purchase_price, :decimal
  end
end
