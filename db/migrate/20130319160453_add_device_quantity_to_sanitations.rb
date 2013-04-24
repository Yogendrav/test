class AddDeviceQuantityToSanitations < ActiveRecord::Migration
  def change
    add_column :sanitations, :device_quantity, :integer
  end
end
