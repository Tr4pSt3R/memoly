class DropUserIdFromRoles < ActiveRecord::Migration
  def up
  	remove_column :roles, :user_id
  end

  def down
  	remove_column :roles, :user_id, :integer
  end
end
