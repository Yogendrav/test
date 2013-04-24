class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :ulica
      t.string :pbroj
      t.string :mjesto
      t.string :client_id

      t.timestamps
    end
  end
end
