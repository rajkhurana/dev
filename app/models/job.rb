class Job < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :payrolls

  attr_accessible :issalaried, :jobdesc, :jobtitle, :payrate
end
