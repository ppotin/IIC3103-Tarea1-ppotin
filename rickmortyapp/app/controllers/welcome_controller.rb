require "http"
require "json"

class WelcomeController < ApplicationController
  def index
    @algo = HTTP.get("https://rickandmortyapi.com/api/episode/?page=1").body
    @episodes = JSON.parse(HTTP.get("https://rickandmortyapi.com/api/episode/?page=1").body)
    @episodes2 = JSON.parse(HTTP.get("https://rickandmortyapi.com/api/episode/?page=2").body)
  end

  def search  
    @input = params[:search].downcase
    @episodes_results = []
    @characters_results = []
    @locations_results = []
    @episodes = JSON.parse(HTTP.get("https://rickandmortyapi.com/api/episode/?page=1").body)
    @episodes2 = JSON.parse(HTTP.get("https://rickandmortyapi.com/api/episode/?page=2").body)
    @locations = JSON.parse(HTTP.get("https://rickandmortyapi.com/api/location").body)
    @episodes["results"].each do |episode|
      if episode["name"].downcase.include?(@input)
        @episodes_results.push(episode)
      end
    end
    @episodes2["results"].each do |episode2|
      if episode2["name"].downcase.include?(@input)
        @episodes_results.push(episode2)
      end
    end
    for i in 1..25 do
      @characters = JSON.parse(HTTP.get("https://rickandmortyapi.com/api/character/?page=" + i.to_s).body)
      @characters["results"].each do |character|
        if character["name"].downcase.include?(@input)
          @characters_results.push(character)
        end
      end
    end
    @locations["results"].each do |location|
      if location["name"].downcase.include?(@input)
        @locations_results.push(location)
      end
    end
  end
end
