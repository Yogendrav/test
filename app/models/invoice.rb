class Invoice < ActiveRecord::Base

  attr_accessible :order_id, :product_id, :quantity, :price, :difference_price, :selling_price, :price_percentage, :prerequisite_attributes
  validates :quantity, :presence => true
  validates :difference_price, :presence => true
  validates :price, :presence => true
  validates :selling_price, :presence => true

  belongs_to :product
  belongs_to :order

  accepts_nested_attributes_for :order
  accepts_nested_attributes_for :product

end