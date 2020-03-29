class EpisodesController < ApplicationController
  def show
    @id = params[:id]
    @episode = JSON.parse(HTTP.get("https://rickandmortyapi.com/api/episode/" + @id).body)
    @ids = ""
    @episode["characters"].each do |url|
      @id_aux = url[42..-1]
      @ids = @ids + "," + @id_aux
    end
    @ids = @ids[1..-1]
    @aux = JSON.parse(HTTP.get("https://rickandmortyapi.com/api/character/" + @ids).body)
  end
end
