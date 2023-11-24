module ReservamosApiHelper
  def fetch_locations_data(city)
    response = HTTParty.get("https://search.reservamos.mx/api/v2/places?q=#{city}")
    JSON.parse(response.body)
  end
end