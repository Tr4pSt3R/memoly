class AddTopicForeignKeytoMemoidTable < ActiveRecord::Migration
  def change
  	add_column :memoids, :topic_id, :integer
  end
end
