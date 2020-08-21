class MoviesController < ApplicationController
  def index
    search = "fight"

    conn = Faraday.new(url: "https://api.themoviedb.org")

    response = conn.get("https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIES_API_KEY']}&language=en-US&query=#{search}&page=1&include_adult=false")

    json = JSON.parse(response.body, symbolize_names: true)

    @movies = json[:results].map do |movie_info|
      Movie.new(movie_info)
    end
    
    # Make movie object (PORO) that can be sent to the view
  end

  def search
    params[:keyword]
  end
end
