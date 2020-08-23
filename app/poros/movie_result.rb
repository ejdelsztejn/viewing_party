class MovieResult
  attr_reader :id,
              :title
              # :genres,
              # :runtime,
              # :summary,
              # :cast,
              # :reviews,
              # :vote_average

  def initialize(data)
    @id = data[:id]
    @title = data[:original_title]
    # @genres = data[:genres]
    # @runtime = data[:runtime]
    # @summary = data[:summary]
    # @cast = data[:cast]
    # @reviews = data[:reviews]
    # @vote_average = data[:vote_average]
  end
end
