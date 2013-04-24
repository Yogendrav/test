class Order < ActiveRecord::Base
  attr_accessible :client_id, :quantity, :difference_price, :products_attributes, :product_price, :order_date, :invoices_attributes
  validates :client_id, :presence => true
  validates :order_date, :presence => true
  belongs_to :client

  has_many :products, through: :invoices
  has_many :invoices, :dependent => :destroy
  accepts_nested_attributes_for :invoices, :allow_destroy => true
end
