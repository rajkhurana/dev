class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :jobtitle
      t.string :jobdesc
      t.float :payrate
      t.boolean :issalaried

      t.timestamps
    end
  end
end
