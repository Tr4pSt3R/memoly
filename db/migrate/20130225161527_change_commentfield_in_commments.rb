class ChangeCommentfieldInCommments < ActiveRecord::Migration
  def change
  	rename_column(:comments, :comment_content, :text)
  end
end
