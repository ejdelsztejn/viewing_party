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
    elsif params.keys.include?("top_rated")
      binding.pry
      movie_facade = MovieFacade.new
      @movies = movie_facade.top_rated_movies
    else
      movie_facade = MovieFacade.new
      @movies = movie_facade.movies
      ## generic list sorted by popularity
    end
  end

  def top_rated
    binding.pry
  end

  def discover
  end
end
