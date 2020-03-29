class CharactersController < ApplicationController
  def show
    @id = params[:id]
    @character = JSON.parse(HTTP.get("https://rickandmortyapi.com/api/character/" + @id).body)
    @ids = ""
    @character["episode"].each do |url|
      @id_aux = url[40..-1]
      @ids = @ids + "," + @id_aux
    end
    @ids = @ids[1..-1]
    @episodes = JSON.parse(HTTP.get("https://rickandmortyapi.com/api/episode/" + @ids).body)
  end
end
