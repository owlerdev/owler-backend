class Event < ActiveRecord::Base
  # Settings for Geokit
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng
  before_save :default_values

  attr_accessible :name, :start_t, :address, :lat, :lng
  
  belongs_to :user
  before_validation :geocode_address

  # Event must have user, name, address, start time, and location
  validates :user, :name, :start_t, :address, :lat, :lng, presence: true

  def hype
    Vote.where(event_id: self.id, kind: 0).count
  end

  def upvotes
    Vote.where(event_id: self.id, kind: 1).count
  end

  private
    def geocode_address
      loc = Geokit::Geocoders::MapboxGeocoder.geocode(address)
      if loc.success
        self.lat, self.lng = loc.lat, loc.lng
      else
        errors.add(:address, "Could not find address")
      end
    end

    def default_values
      # default end time: 4 hours after start
      if self.end_t == nil
        self.end_t = self.start_t + 4.hours
      end
    end
end
