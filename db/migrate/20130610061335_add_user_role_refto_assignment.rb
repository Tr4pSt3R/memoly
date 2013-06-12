class AddUserRoleReftoAssignment < ActiveRecord::Migration
  def change
  	add_column :assignments, :role_id, :integer
  	add_column :assignments, :user_id, :integer
  end
end
