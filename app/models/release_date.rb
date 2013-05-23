class ReleaseDate < ActiveRecord::Base
	belongs_to :memoid
  	attr_accessible :ping_date, :memoid_id

  	# after_create :calculate_default_dates

  	DEFAULT_DATES = [1, 7, 30, 90, 180].freeze
end
