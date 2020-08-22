class SearchFacade
  attr_reader :keyword

  def initialize(keyword)
    @keyword = keyword
    @movies_service = MoviesService.new
  end

  def search_movies
    movies_info = get_search_movies.take(40)

    @movies = movies_info[:results].map do |movie_info|
      Movie.new(movie_info)
    end
  end

  def get_search_movies
    @movies_service.search_movies(@keyword)
  end
end
