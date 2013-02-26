class Comment < ActiveRecord::Base
  attr_accessible :text, :post_id

  belongs_to :post
end
