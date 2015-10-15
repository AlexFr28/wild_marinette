class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude
  geocoded_by :adress
  after_validation :geocode 
end
