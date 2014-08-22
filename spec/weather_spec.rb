require 'weather'

class WeatherHolder
	include Weather
end

describe WeatherHolder do 
	it 'knows the weather' do 
		weather_holder = WeatherHolder.new
		expect([:sunny,:stormy]).to include(weather_holder.weather)
	end
end