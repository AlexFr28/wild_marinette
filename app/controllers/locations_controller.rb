class LocationsController < ApplicationController

	def index
		@locations = Location.all

		@hash = Gmaps4rails.build_markers(@locations) do |location, marker|
	    marker.lat location.latitude
	    marker.lng location.longitude
    end

	end

	def new
		@location = Location.new
	end

	def create
		@location = Location.new(param_location)
		# @location.meteo
		
		if @location.save
			redirect_to root_path
		end
	end

	def show
		@location = Location.find(params[:id])
		@tempC = @location.temperature
		@icon = @location.weather
		@humidity = (@location.humidity * 100).round
	end

	def destroy
		@location = Location.find(params[:id])
		@location.destroy

		redirect_to root_path
	end

	private

	def param_location
		params.require(:location).permit(:town, :country, :latitude, :longitude)
	end

end
