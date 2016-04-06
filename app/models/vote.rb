class Vote < ActiveRecord::Base
  enum status: { before: 0, during: 1 }
  belongs_to :user
  belongs_to :event 

  attr_accessible :user, :event, :type

  before_save :get_type  
  
  validates :user, :event, presence: true
  
  def get_type
    # Differentiate between hype and current upvotes
    # TODO: no upvotes after end time?
    if DateTime.now < self.event.start_t
      self.type = 0
    else
      self.type = 1
    end    
  end
end
