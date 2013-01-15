class Memoid < ActiveRecord::Base
  attr_accessible :ISBN, :author, :expires_on, :note, :page, :rating, :title, :public

  #Each Memoid is uniquely attributed to a user
  belongs_to :user
end
