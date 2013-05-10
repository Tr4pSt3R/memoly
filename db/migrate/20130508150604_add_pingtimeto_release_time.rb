class AddPingtimetoReleaseTime < ActiveRecord::Migration
  def change
  	add_column :releasetimes, :pingtime, :time
  end
end
