class AddUserForeignKeyToReleasetime < ActiveRecord::Migration
  def change
  	add_column :users, :releasetime_id, :integer
  end
end
