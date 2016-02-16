class Event < ActiveRecord::Base
  # Settings for Geokit
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng
  
  belongs_to :user

  # Event must have user, name, address, start time, and location
  validates :user, presence: true
  validates :name, presence: true
  validates :start_t, presence: true
  validates :address, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
end
