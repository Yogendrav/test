class AddPricePercentageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price_percentage, :float
  end
end
