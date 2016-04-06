class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_token_authenticatable

  has_many :events
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation

  def hype
    Vote.where(event_id: self.id, type: 0).count
  end

  def upvotes
    Vote.where(event_id: self.id, type: 1).count
  end
end
