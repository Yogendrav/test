class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
    	t.string :name
      	t.string :oib
      	t.text :comment

      	t.timestamps
    end
  end
end
