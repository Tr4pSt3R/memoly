class RemoveReleaseTimeFromUserTable < ActiveRecord::Migration
  def change
  	remove_column :users, :releasetime_id
  end
end
