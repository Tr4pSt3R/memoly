class Roles < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :users

  def admin
  	find_or_create_by_name("admin")
  end
end
