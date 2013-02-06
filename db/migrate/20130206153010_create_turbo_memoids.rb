class CreateTurboMemoids < ActiveRecord::Migration
  def change
    create_table :turbo_memoids do |t|
      t.string :filename
      t.string :filetype

      t.timestamps
    end
  end
end
