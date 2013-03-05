class Memoid < ActiveRecord::Base
  attr_accessible :note, :public
  attr_accessible :release_dates

  validates :note, :presence => true
  
  #Each Memoid is uniquely attributed to a user
  belongs_to :user

  #Each Memoid has many settings
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

    def self.settings_attr_accessors(*args)
      args.each do |method_name|
        eval "
          def #{method_name}
            self.settings.send(:#{method_name})
          end
          def #{method_name}=(value)
            self.settings.send(:#{method_name}=, value)
          end
        "
      end
    end

    settings_attr_accessors :release_dates

end
