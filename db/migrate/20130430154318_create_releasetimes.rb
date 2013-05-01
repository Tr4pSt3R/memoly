class CreateReleasetimes < ActiveRecord::Migration
  def change
    create_table :releasetimes do |t|

      t.timestamps
    end
  end
end
