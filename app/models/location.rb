class Location < ActiveRecord::Base

	# attr_accessible :town, :country, :latitude, :longitude
	attr_reader :forecast

	geocoded_by :town
	after_validation :geocode

	def temperature
		forecast = ForecastIO.forecast(self.latitude, self.longitude)
		((forecast.currently.temperature-32)*5/9).round(2)
	end

end
