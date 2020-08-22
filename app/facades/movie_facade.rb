class MovieFacade

  def initialize
    @movies_service = MoviesService.new
  end

  def top_rated_movies
    movies_info = get_top_rated_movies.take(40)

    @movies = movies_info[:results].map do |movie_info|
      Movie.new(movie_info)
    end
  end

  def get_top_rated_movies
    @movies_service.top_rated_movies
  end

  def movies
    movies_info = get_movies.take(40)

    @movies = movies_info[:results].map do |movie_info|
      Movie.new(movie_info)
    end
  end

  def get_movies
    @movies_service.movies
  end
end
