class MoviesService
  def search_movies(search_word)
    results = conn.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIES_API_KEY']}&language=en-US&query=#{search_word}&page=1&include_adult=false")
    JSON.parse(results.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.themoviedb.org")
  end
end
