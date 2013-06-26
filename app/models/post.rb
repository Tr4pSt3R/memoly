class Post < ActiveRecord::Base
  attr_accessible :text, :title

  belongs_to :user
  has_many :comments

  validates :title, :presence => true
  validates :text, 	:presence => true
end
