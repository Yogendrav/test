class Sanitation < ActiveRecord::Base
  attr_accessible :address_id, :client_id, :end_date, :product_id, :start_date, :device_quantity, :contract_id, :last_sanitation_date, :sanitation_price, :prerequisite_attributes
  belongs_to :client
  belongs_to :product
  belongs_to :contract
end
