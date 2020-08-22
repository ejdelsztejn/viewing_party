class SearchFacade
  attr_reader :keyword

  def initialize(keyword)
    @keyword = keyword
    @movies_service = MoviesService.new
  end

  def search_movies
    movies_info = results_search_movies
    require "pry"; binding.pry
    @movies = movies_info[:results].map do |movie_info|
      Movie.new(movie_info)
    end.take(40)
  end

  def results_search_movies
    @movies_service.search_movies(@keyword)
  end
end
