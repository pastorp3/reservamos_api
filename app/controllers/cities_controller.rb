class CitiesController < ApplicationController
  include ReservamosApiHelper
  include WeatherApiHelper

  def get_weather
    cities = fetch_locations_data(weather_params).select { |location| location['result_type'] == 'city' }
                .map { |location| { name: location['city_name'], lat: location['lat'], lon: location['long'] } }

    promises = cities.map do |city|
      Concurrent::Promise.execute do
        fetch_weather_data(city[:lat], city[:lon])
      end
    end

    promises.each(&:value)

    weather_data = promises.map(&:value)

    response = cities.map.with_index do |city, index|
      temp = weather_data[index]['daily'].map do |day|
        { min: day['temp']['min'], max: day['temp']['max'] }
      end

      { city: city[:name], daily_temp: temp }
    end

    render json: response, status: :ok
  end

  private

  def weather_params
    params.permit(:city)
  end
end
