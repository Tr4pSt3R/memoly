class AddReleaseFlagToReleaseDateTable < ActiveRecord::Migration
  def change
  	add_column :release_dates, :released, :boolean
  end
end
