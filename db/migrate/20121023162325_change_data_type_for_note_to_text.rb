class ChangeDataTypeForNoteToText < ActiveRecord::Migration
  def up
	change_table :memoids do |t|
	   t.change :note, :text
	end
  end


  def down
	change_table :memoids do |t|
	   t.change :note, :string
	end
  end
end
