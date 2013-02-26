class ChangePostfieldColumnname < ActiveRecord::Migration
  def change
  	rename_column(:posts, :post_content, :text)
  end
end
