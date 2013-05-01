class RemoveUserFkFromReleaseTime < ActiveRecord::Migration
  def change
  	remove_column :users, :releasetime_id, :integer
  end
end
