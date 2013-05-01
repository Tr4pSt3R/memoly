class Memoid < ActiveRecord::Base
  attr_accessible :note, :public
  attr_accessible :release_dates

  validates :note, :presence => true
  belongs_to :user
  has_many :releasedates

  def public?
    self.public
  end
end
