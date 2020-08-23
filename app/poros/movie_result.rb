class MovieResult
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :summary,
              :genres
              # :cast,
              # :reviews


  def initialize(data)
    @id = data[:id]
    @title = data[:original_title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @summary = data[:overview]
    @genres = data[:genres]
    # @cast = data[:cast]
    # @reviews = data[:reviews]
  end
end
