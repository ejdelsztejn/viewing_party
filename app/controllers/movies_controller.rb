class MoviesController < ApplicationController
  def index
    if params.keys.include?("keyword")
      keyword = params[:keyword]
      search_facade = SearchFacade.new(keyword)
      @movies = search_facade.search_movies

      # search_word = params[:keyword]
      # conn = Faraday.new(url: "https://api.themoviedb.org")
      #
      # response = conn.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIES_API_KEY']}&language=en-US&query=#{search_word}&page=1&include_adult=false")
      #
      # json = JSON.parse(response.body, symbolize_names: true)
    else
      search_word = "happy"
      conn = Faraday.new(url: "https://api.themoviedb.org")

      response = conn.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIES_API_KEY']}&language=en-US&query=#{search_word}&page=1&include_adult=false")

      json = JSON.parse(response.body, symbolize_names: true)

      @movies = json[:results].map do |movie_info|
        Movie.new(movie_info)
      end
    end
    # Make movie object (PORO) that can be sent to the view
  end
end
