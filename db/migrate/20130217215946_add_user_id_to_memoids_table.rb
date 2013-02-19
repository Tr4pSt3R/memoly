class AddUserIdToMemoidsTable < ActiveRecord::Migration
  def change
  	add_column :memoids, :user_id, :integer
  end
end
