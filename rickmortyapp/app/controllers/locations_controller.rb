class LocationsController < ApplicationController
  def show
      @id = params[:id]
      @location = JSON.parse(HTTP.get("https://rickandmortyapi.com/api/location/" + @id).body)
      @ids = ""
      @location["residents"].each do |url|
        @id_aux = url[42..-1]
        @ids = @ids + "," + @id_aux
      end
      @ids = @ids[1..-1]
      @characters = JSON.parse(HTTP.get("https://rickandmortyapi.com/api/character/" + @ids).body)
  end
end
