class DropMemoididColumnFromReleasetime < ActiveRecord::Migration
  def up
  	# add_column :releasetimes, :user_id, :integer
  end

  def down
  	# remove_column :releasetimes, :memoid_id, :integer
  end
end
