class Group < ActiveRecord::Base
  attr_accessible :name, :scope
  has_many :users
end
