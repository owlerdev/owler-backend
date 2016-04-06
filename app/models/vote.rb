class Vote < ActiveRecord::Base
  enum kind: { before: 0, during: 1 }
  belongs_to :user
  belongs_to :event 

  attr_accessible :user, :event, :kin

  before_save :get_kind
  
  validates :user, :event, presence: true
  
  def get_kind
    # Differentiate between hype and current upvotes
    # TODO: no upvotes after end time?
    if DateTime.now < self.event.start_t
      self.kind = 0
    else
      self.kind = 1
    end    
  end
end
