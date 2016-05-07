class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :events

  # Only W&M email addresses for now
  validates :email, format: { with: /.*@email\.wm\.edu/, message: "Only allows W&M email addresses." }

  attr_accessible :email, :password, :password_confirmation
end
