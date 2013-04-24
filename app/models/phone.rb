class Phone < ActiveRecord::Base
  attr_accessible :number, :type_phone, :prerequisite_attributes
  
  belongs_to :client
  belongs_to :supplier
  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :supplier
end
