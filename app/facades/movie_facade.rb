class MovieFacade
  def initialize
    @movies_service = MoviesService.new
  end

  def top_rated_movies
    movies_info = results_top_rated_movies

    @movies = movies_info[:results].map do |movie_info|
      Movie.new(movie_info)
    end.take(40)
  end

  def results_top_rated_movies
    @movies_service.top_rated_movies
  end

  def movies
    movies_info = results_movies

    @movies = movies_info[:results].map do |movie_info|
      Movie.new(movie_info)
    end.take(40)
  end

  def results_movies
    @movies_service.movies
  end
end
