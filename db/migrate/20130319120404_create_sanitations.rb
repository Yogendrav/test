class CreateSanitations < ActiveRecord::Migration
  def change
    create_table :sanitations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :client_id
      t.integer :address_id
      t.integer :product_id

      t.timestamps
    end
  end
end
