class CreateUserPhones < ActiveRecord::Migration
  def change
    create_table :user_phones do |t|
      t.string :number
      t.integer :type_phone
      t.string :user_id

      t.timestamps
    end
  end
end
