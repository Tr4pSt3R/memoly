class Memoid < ActiveRecord::Base
  attr_accessible :note, :public
  attr_accessible :release_dates

  validates :note, :presence => true
  belongs_to :user
  has_settings 
  has_many :releasedates

  def public?
    self.public
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
