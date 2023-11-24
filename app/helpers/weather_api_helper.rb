module WeatherApiHelper
  def fetch_weather_data(lat, lon)
    # Add api key after appid=
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lon}&units=metric&exclude=current,minutely,hourly,alerts&appid=")
    JSON.parse(response.body)
  end
end


