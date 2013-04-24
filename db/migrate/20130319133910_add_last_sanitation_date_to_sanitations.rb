class AddLastSanitationDateToSanitations < ActiveRecord::Migration
  def change
    add_column :sanitations, :last_sanitation_date, :date
  end
end
