class CreateMemoids < ActiveRecord::Migration
  def change
    create_table :memoids do |t|
      t.string :note
      t.integer :page
      t.integer :rating
      t.string :title
      t.string :author
      t.string :ISBN
      t.datetime :expires_on

      t.timestamps
    end
  end
end
