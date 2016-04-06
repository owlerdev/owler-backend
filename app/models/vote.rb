class Vote < ActiveRecord::Base
  enum status: { before: 0, during: 1 }
  belongs_to :user
  belongs_to :event 

  attr_accessible :user, :event, :type

  before_save :get_type  
  
  validates :user, :event, presence: true
  
  def get_type
    if Time.now < self.event.start_t:
      time = 0
    else
      time = 1
    end    
  end
end
