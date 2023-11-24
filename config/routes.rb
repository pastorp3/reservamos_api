Rails.application.routes.draw do
  get "/get_weather", to: "cities#get_weather"
end
