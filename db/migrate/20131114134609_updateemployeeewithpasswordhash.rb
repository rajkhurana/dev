class Updateemployeeewithpasswordhash < ActiveRecord::Migration
  def change
    remove_column :employees,:password
  #  add_column :employees, :password_hash, :string
  #  add_column :employees, :password_salt, :string
  end
end
