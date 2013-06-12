class RemoveRolesUsersTable < ActiveRecord::Migration
  def down
  	drop_table :roles_users
  end
end
