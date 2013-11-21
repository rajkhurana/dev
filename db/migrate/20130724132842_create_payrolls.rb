class CreatePayrolls < ActiveRecord::Migration
  def change
    create_table :payrolls do |t|
      t.integer :user_id
      t.date :startday
      t.date :endday
      t.float :hoursworked
      t.float :grosspay
      t.float :deductions
      t.float :netpay

      t.timestamps
    end
  end
end
