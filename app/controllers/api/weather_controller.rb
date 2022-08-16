module Api
  class WeatherController < Api::ApplicationController
    def current
        city = find_city
        UpdateCurrentWeatherJob.perform_now(city) unless city.weather_current?('current')
      data = city.weathers.currents.last.current
      render json: data
    end

    def by_time
      city = find_city
      closest = city.closest(params[:timestamp])
      if closest.nil?
        render json: { 404 => 'Not Found' }, status: :not_found
      else
        render json: closest.current
      end
    end
  end
end
