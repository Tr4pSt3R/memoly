class DropBlogIt < ActiveRecord::Migration
  def change
  	drop_table :blog_posts
  	drop_table :blog_comments
  	drop_table :taggings
    drop_table :tags
  end
end
