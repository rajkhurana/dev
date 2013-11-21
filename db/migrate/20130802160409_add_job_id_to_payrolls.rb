class AddJobIdToPayrolls < ActiveRecord::Migration
  def change
    add_column :payrolls, :job_id, :integer
  end
end
