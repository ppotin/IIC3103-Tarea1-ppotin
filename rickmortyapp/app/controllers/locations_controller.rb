class LocationsController < ApplicationController
  def show
      @id = params[:id]
      @location = JSON.parse(HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/location/" + @id).body)
      @ids = ""
      @location["residents"].each do |url|
        @id_aux = url[63..-1]
        @ids = @ids + "," + @id_aux
      end
      @ids = @ids[1..-1]
      @characters = JSON.parse(HTTP.get("https://integracion-rick-morty-api.herokuapp.com/api/character/" + @ids).body)
  end
end
