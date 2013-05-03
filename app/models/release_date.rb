class ReleaseDate < ActiveRecord::Base
	belongs_to :memoid
  	attr_accessible :ping_date, :memoid_id

  	DEFAULT_DATES = %w(1 7 30 90 180).freeze
end
