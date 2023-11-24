# Weather Forecast API - Reservamos Challenge

## Setup Instructions

### Prerequisites
- Ruby "3.1.2"
- Rails "7.0.8"

### Getting Started

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/your-username/weather-api.git

2. **Install Dependencies:**
   ```bash
   bundle install

2. **Create the Database:**
   ```bash
   rails db:create
   
3. **Add your api key:**

   open app/helpers/weather_api_helper.rb in your local and add your key  after appid=

5. **Start the Rails Server:**
   ```bash
   rails server

6. **Get Weather Data:**
   ```bash
   http://localhost:3000/get_weather?city={City Name}
  Visit it in your browser to retrieve weather information for a specific city. Replace {City Name} with the desired city.

Example: http://localhost:3000/get_weather?city=Monterrey
  
Enjoy the magic of weather data!

## Notes

If for some reason the app starts giving errors about nil objects is because your API kay might be blocked because the app does an API call per city and it can block your key. if it happens try with a new key to continue testing
