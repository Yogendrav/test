class Address < ActiveRecord::Base
  attr_accessible :mjesto, :pbroj, :ulica, :prerequisite_attributes
  
  belongs_to :client
  belongs_to :supplier
  accepts_nested_attributes_for :client
  accepts_nested_attributes_for :supplier

  def ulica_i_mjesto
    ulica + ' ' + mjesto
  end
end