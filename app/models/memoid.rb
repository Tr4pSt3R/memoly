class Memoid < ActiveRecord::Base
  attr_accessible :ISBN, :author, :expires_on, :note, :page, :rating, :title
end
