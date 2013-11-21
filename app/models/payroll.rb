class Payroll < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  attr_accessible :deductions, :endday, :grosspay, :hoursworked, :netpay, :startday
end
