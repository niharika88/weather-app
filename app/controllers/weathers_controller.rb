class WeathersController < ApplicationController
  before_action :set_weather, only: [:show, :edit, :update, :destroy]

  # GET /weathers
  # GET /weathers.json
  def index
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?APPID=0bd53bfea661dc3aeb620e5fd01c4aff&q=#{weather_params["city"]},#{weather_params["country"]}")
    if response.parsed_response["cod"] == 200 
    @weather_stat = JSON.parse(response.body)
    p @weather_stat
    else
    @weather_stat = response.parsed_response
    end
    @weather_stat
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weather
      @weather = Weather.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weather_params
      params.permit(:city, :country)
    end
end
