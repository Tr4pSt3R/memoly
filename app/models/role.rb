class Role < ActiveRecord::Base
  attr_accessible :name

  has_many :assignments
  has_many :users, :through => :assignments

  def admin
  	find_or_create_by_name("admin")
  end
end
