class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :surname, :username, :email, :password, :password_confirmation, :remember_me, :superior, :user_phones_attributes
  has_many :clients, :dependent => :destroy
  has_many :suppliers, :dependent => :destroy

  has_many :user_phones, :dependent => :destroy
  accepts_nested_attributes_for :user_phones, :reject_if => lambda { |a| a[:number].blank? }, :allow_destroy => true
end
