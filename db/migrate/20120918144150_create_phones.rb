class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t| #, {:id => false}
      t.string :number
      t.integer :type_phone
      t.string :client_id
      t.timestamps
    end
    #execute "ALTER TABLE phones ADD PRIMARY KEY (oib);"
  end
end