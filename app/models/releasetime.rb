class Releasetime < ActiveRecord::Base
	belongs_to :user
	attr_accessible :pingtime
end
