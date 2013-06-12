class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments, :id => false do |t|
    	t.references :role, :user
    	t.timestamps
    end
  end
end
