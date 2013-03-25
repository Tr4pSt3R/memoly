class CreateReleaseDates < ActiveRecord::Migration
  def change
    create_table :release_dates do |t|
      t.datetime :ping_date
      t.integer :memoid_id
      t.timestamps
    end
  end
end
