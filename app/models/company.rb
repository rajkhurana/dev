class Company < ActiveRecord::Base
   attr_accessible :name,:ssn,:address,:zipcode,:city,:country,:doe,:phonenumber,
    :email,:url,:password,:password_confirmation
  # validates_format_of :dob, :with => /\d{4}\/\d{2}\/\d{2}/, :message => "^Date must be in the following format: mm/dd/yyyy"
  validates_format_of :doe, :with => /\d{4}\-\d{2}\-\d{2}/,:message => "^Date must be in the following format: yyyy-mm-dd"


  attr_accessor :password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create, :message => "Can't be blank"
  validates_uniqueness_of :email
  
 
end
