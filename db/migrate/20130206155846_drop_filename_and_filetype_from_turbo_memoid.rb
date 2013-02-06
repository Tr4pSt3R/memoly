class DropFilenameAndFiletypeFromTurboMemoid < ActiveRecord::Migration
  def change
  	remove_column :turbo_memoids, :filename, :string
  	remove_column :turbo_memoids, :filetype, :string
  end
end
