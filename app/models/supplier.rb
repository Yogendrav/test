class Supplier < ActiveRecord::Base
  attr_accessible :comment, :cr, :dop, :jmbg, :ms, :name, :oib, :profession, :sex, :surname, :title, :user_id, :change_user_id, :phones_attributes, :emails_attributes, :addresses_attributes
  #validates :oib, :numericality => { :message => "nije broj.", :only_integer => true }
  validates :name, :presence => true
=begin
  validates :oib, :presence => true
  validates :jmbg, :presence => true
  validates :title, :presence => true
  self.primary_key = 'oib'
=end
  belongs_to :user
  has_many :phones, :dependent => :destroy
  accepts_nested_attributes_for :phones, :reject_if => lambda { |a| a[:number].blank? }, :allow_destroy => true
  has_many :emails, :dependent => :destroy 
  accepts_nested_attributes_for :emails, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
  has_many :addresses, :dependent => :destroy 
  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:ulica].blank? }, :allow_destroy => true
  has_many :products, :dependent => :destroy

  #has_and_belongs_to_many :phones
  #accepts_nested_attributes_for :phones, :allow_destroy => true, :reject_if => :all_blank
  #has_and_belongs_to_many :emails
  #accepts_nested_attributes_for :emails, :allow_destroy => true, :reject_if => :all_blank
=begin	
	
	has_many :phones, :dependent => :destroy 
	accepts_nested_attributes_for :phones, :reject_if => lambda { |a| a[:number].blank? }, :allow_destroy => true
	has_many	 :emails, :dependent => :destroy 
	accepts_nested_attributes_for :emails, :reject_if => lambda { |a| a[:email].blank? }, :allow_destroy => true
	
=end
end
