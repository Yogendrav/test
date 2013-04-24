class UserPhone < ActiveRecord::Base
  attr_accessible :number, :type_phone, :prerequisite_attributes

  belongs_to :users
  accepts_nested_attributes_for :users
end
