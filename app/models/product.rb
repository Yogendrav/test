class Product < ActiveRecord::Base
  attr_accessible :name, :product_code, :test, :client_type, :description, :user_id, :change_user_id, :purchase_price, :supplier_id, :price_percentage
  
  belongs_to :supplier
  #has_and_belongs_to_many :contracts
  #accepts_nested_attributes_for :contracts

  has_many :contract
  has_many :producttypes

  has_many :invoices
  has_many :orders, through: :invoices ,dependent: :destroy
  has_many :sanitations
end
