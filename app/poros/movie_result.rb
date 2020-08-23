class MovieResult
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :summary,
              :genres,
              :reviews,
              :cast

  def initialize(data)
    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @summary = data[:summary]
    @genres = data[:genres]
    @reviews = data[:reviews]
    @cast = data[:cast]
  end

  def genres
    genres = @genre_info.map do |genre|
      genre[:name]
    end
    genres.join(', ')
  end

  def review_count
    reviews.count
  end
end
