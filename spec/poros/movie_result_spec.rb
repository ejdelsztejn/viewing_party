require 'rails_helper'

describe MovieResult do
  it 'exists' do
    attrs = {
      id: 1,
      title: "Fight Club",
      vote_average: 8.5,
      runtime: 100,
      summary: "Classic movie",
      genres: [{:name=>"Drama"}, {:name=>"Comedy"}],
      cast: [{:name=>"Blake Lively"}, {:name=>"Morgan Freeman"}]
    }

    movie = MovieResult.new(attrs)

    expect(movie).to be_a MovieResult
    expect(movie.title).to eq("Fight Club")
    expect(movie.id).to eq(1)
    expect(movie.vote_average).to eq(8.5)
    expect(movie.runtime).to eq(100)
    expect(movie.summary).to eq("Classic movie")
    expect(movie.genres).to eq("Drama, Comedy")
    expect(movie.cast).to eq([{:name=>"Blake Lively"}, {:name=>"Morgan Freeman"}])
  end
end
