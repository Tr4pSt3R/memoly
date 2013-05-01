class ReleaseDate < ActiveRecord::Base
	belongs_to :memoid
  	attr_accessible :ping_date, :memoid_id
end
