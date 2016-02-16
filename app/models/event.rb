class Event < ActiveRecord::Base
  # Settings for Geokit
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng

  belongs_to :user
end
