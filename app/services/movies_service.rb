class MoviesService
  def search_movies(search_word)
    results = conn.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIES_API_KEY']}&language=en-US&query=#{search_word}&page=1&include_adult=false")
    JSON.parse(results.body, symbolize_names: true)
  end

  def top_rated_movies
    results = conn.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['MOVIES_API_KEY']}&language=en-US&page=1")
    JSON.parse(results.body, symbolize_names: true)
  end

  def movies
    ## list of movies just based on popularity
    results = conn.get("https://api.themoviedb.org/3/movie/popular?api_key=#{ENV['MOVIES_API_KEY']}&language=en-US&page=1")
    JSON.parse(results.body, symbolize_names: true)
  end

  def movie_details(movie_id)
    results = conn.get("https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{ENV['MOVIES_API_KEY']}")
    JSON.parse(results.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end
end
