class Memoid < ActiveRecord::Base
  attr_accessible :ISBN, 
                  :author, 
                  :expires_on, 
                  :note, 
                  :page, 
                  :rating, 
                  :title, 
                  :public

  #Each Memoid is uniquely attributed to a user
  belongs_to :user
  has_settings 

  def due_in_next_hour?
  	s = seconds_until_next_release_date
    puts "seconds_until_next_release_date: #{s}"
    s = s.abs

  	return ( s <= 1.hour )
  end

  def next_due_date
    if self.settings.multiplier.empty?
        z = created_at + Settings.defaults['multiplier'].first
      else
        z = created_at + self.settings['multiplier'].first
    end

    return z
  end

  private
  	def seconds_until_next_release_date
  		(Time.current - next_due_date).abs
    end

end
