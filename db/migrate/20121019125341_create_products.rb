class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_code
      t.text :description
      t.integer :client_id

      t.timestamps
    end
  end
end
