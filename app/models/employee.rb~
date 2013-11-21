class Employee < ActiveRecord::Base
 
  attr_accessible :firstname,:lastname,:ssn,:address,:zipcode,:city,:state,:dob,:phonenumber,
    :email,:department,:password,:password_confirmation
  # validates_format_of :dob, :with => /\d{4}\/\d{2}\/\d{2}/, :message => "^Date must be in the following format: mm/dd/yyyy"
  #validates_format_of :dob, :with => /\d{4}\-\d{2}\-\d{2}/,:message => "^Date must be in the following format: yyyy-mm-dd"
   validates_format_of :phonenumber,:with => /\d{3}-\d{3}-\d{4}/, :message =>"Invalid phone number"

 # before_save :encrypt_password
  attr_accessor :password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create, :message => "Can't be blank"
  validates_uniqueness_of :email  
  
end
