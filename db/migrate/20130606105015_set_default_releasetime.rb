class SetDefaultReleasetime < ActiveRecord::Migration
  def up
  	change_column :releasetimes, :pingtime, :time, :default => Time.local(2000,1,1,8)
  end

  def down
  	change_column :releasetimes, :pingtime, :time, :default => nil
  end
end
