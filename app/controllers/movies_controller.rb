class MoviesController < ApplicationController
  def index
    if params.keys.include?('keyword')
      keyword = params[:keyword]
      search_facade = SearchFacade.new(keyword)
      @movies = search_facade.search_movies
      require "pry"; binding.pry
    elsif params.keys.include?('top_rated')
      movie_facade = MovieFacade.new
      @movies = movie_facade.top_rated_movies
    else
      movie_facade = MovieFacade.new
      @movies = movie_facade.movies
      ## generic list sorted by popularity
    end
  end

  def discover; end
end
