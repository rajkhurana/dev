class JobsUser < ActiveRecord::Base
  attr_accessible :job_id, :user_id
end
