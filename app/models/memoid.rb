class Memoid < ActiveRecord::Base 
  attr_accessible :note, :public

  # Validations
  validates :note, :presence => true
  validates :user_id, :presence => true
  
  #Associations
  belongs_to :user
  has_many :release_dates

  def public?
    self.public
  end
end
