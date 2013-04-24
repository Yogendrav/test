class AddSanitationPriceToSanitations < ActiveRecord::Migration
  def change
    add_column :sanitations, :sanitation_price, :float
  end
end
