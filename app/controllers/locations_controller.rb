class LocationsController < ApplicationController

	def index
		@locations = Location.all
		# binding.pry
		# @forecast = Location.meteo
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
	end

	private

	def param_location
		params.require(:location).permit(:town, :country, :lat, :lon)
	end

end
