class CreateJobsUsers < ActiveRecord::Migration
  def change
    create_table :jobs_users do |t|
      t.integer :job_id
      t.integer :user_id

      t.timestamps
    end
  end
end
