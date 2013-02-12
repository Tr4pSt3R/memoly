class Memoid < ActiveRecord::Base
  attr_accessible :ISBN, :author, :expires_on, :note, :page, :rating, :title, :public

  #Each Memoid is uniquely attributed to a user
  belongs_to :user
  has_settings 

  def due_in_next_hour?
  	s = seconds_until_next_release_date
  	if ( 1.hour < ) 
  end

  def next_due_date
  	self.created_at + Settings.defaults['multiplier'].first
  end

  private
  	def seconds_until_next_release_date
  		(Time.current - next_due_date).abs
	end
end
