class MovieResult
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :summary,
              :genre_info
              # :cast,
              # :reviews


  def initialize(data)
    @id = data[:id]
    @title = data[:original_title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @summary = data[:overview]
    @genre_info = data[:genres]
    # @cast = data[:cast]
    # @reviews = data[:reviews]
  end

  def genres
    genres = @genre_info.map do |genre|
      genre[:name]
    end
    genres.join(', ')
  end
end
