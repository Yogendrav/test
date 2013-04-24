class Contract < ActiveRecord::Base
  attr_accessible :difference_price, :quantity, :selling_price, :user_id, :change_user_id, :product_ids, :client_id, :contract_number, :supplier_id, :product_id, :valid_contract, :contract_date, :contract_end_date, :sanitations_attributes
  validates :difference_price, :presence => true
  validates :quantity, :presence => true
  validates :selling_price, :presence => true
  validates :contract_date, :presence => true
  validates :contract_end_date, :presence => true
  belongs_to :client
  #has_and_belongs_to_many :products
  #accepts_nested_attributes_for :products
  belongs_to :product

  has_many :sanitations
  accepts_nested_attributes_for :sanitations, :allow_destroy => true

end
