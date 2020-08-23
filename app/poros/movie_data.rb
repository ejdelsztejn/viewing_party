class MovieData
  def self.all_data(movie_id)
    general_info = self.general_info(movie_id)
    reviews = self.reviews(movie_id)
    require "pry"; binding.pry
    {
      id: general_info[:id],
      title: general_info[:original_title],
      vote_average: general_info[:vote_average],
      runtime: general_info[:runtime],
      summary: general_info[:overview],
      genres: general_info[:genres],
      #reviews: reviews[:]
      # @reviews = data[:reviews]
    }
  end

  def self.general_info(movie_id)
    MoviesService.new.general_movie_details(movie_id)
  end

  def self.reviews(movie_id)
    MoviesService.new.movie_reviews(movie_id)
  end

  def self.cast(movie_id)
    MoviesService.new.movie_cast(movie_id)
  end
end
