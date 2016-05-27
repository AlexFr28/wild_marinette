class Location < ActiveRecord::Base

  attr_accessible :address, :latitude, :longitude
  geocoded_by :adress
  after_validation :geocode
	attr_reader :forecast


	def temperature
		@forecast = ForecastIO.forecast(self.latitude, self.longitude)
		# binding.pry
		((@forecast.currently.temperature-32)*5/9).round
	end

	def weather
		@forecast.currently.icon
	end

	def humidity
		@forecast.currently.humidity.round(2)
	end
end
