class AddPublicFlagToMemoid < ActiveRecord::Migration
  def change
    add_column :memoids, :public, :boolean
  end
end
