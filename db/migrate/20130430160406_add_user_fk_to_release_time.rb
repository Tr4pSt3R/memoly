class AddUserFkToReleaseTime < ActiveRecord::Migration
  def change
  	add_column :releasetimes, :user_id, :integer
  end
end
