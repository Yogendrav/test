class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :oib
      t.text :comment

      t.timestamps
    end
    #execute "ALTER TABLE clients ADD PRIMARY KEY (oib);"
  end
end
