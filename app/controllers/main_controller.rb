require_relative '../services/weather_service'

class MainController < ApplicationController

  def index
    # Uncomment and pass a parameter to the get function
	# @w = WeatherService.get()
	# Using some of the potential lab3
    @cityName = params[:city]
    @w = WeatherService.get(@cityName)
    if @w
		@temperature = (9.0/5) * (@w[:temperature] - 273) + 32
		city = City.new(
			name: params[:city],
			description: @w[:description],
			temperature: @temperature
		)
		city.save
	end
  end
end
