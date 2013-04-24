class AddSuperiorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :superior, :string
  end
end
