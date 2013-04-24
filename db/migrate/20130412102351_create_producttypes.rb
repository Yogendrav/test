class CreateProducttypes < ActiveRecord::Migration
  def change
    create_table :producttypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
