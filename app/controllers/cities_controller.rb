class CitiesController < ApplicationController
	#creating a new city
	def create
		@cityName = params[:city]
    	@w = WeatherService.get(@cityName)
    	if @w
			#@temperature = (9.0/5) * (@w[:temperature] - 273) + 32
			city = City.new(
				name: @cityName,
				landmark: params[:landmark],
				population: params[:population]
			)
			city.save
		end
		@cities = City.all.values()
		render 'view'
	end

	#updating a city
	# From potential lab3 solution and beginning of the homework3
	def update
		if params[:city].present? 
			@city = params[:city]
			@city_pop = params[:population]
			@city_landmark = params[:landmark]
		else
			@city = 'Los Angeles'
			@city_pop = 3,976,000
			@city_landmark = 'Disneyland'
		end
		render 'update'
	end

	#to view the info of a city or cities
	def view
		if params[:city].present? and City.all.has_key?(params[:city].to_sym)
			@cities = []
			@cities  << City.all[params[:city].to_sym]
		else
			@cities = City.all.values()
		end
		render 'view'
	end

	#show the forum for creating anew city
	def new
		render 'new'
	end
end