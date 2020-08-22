require 'rails_helper'

describe Movie do
  it 'exists' do
    attrs = {
      title: "Fight Club",
      vote_average: 8.5
    }

    movie = Movie.new(attrs)

    expect(movie).to be_a Movie
    expect(movie.title).to eq("Fight Club")
    expect(movie.vote_average).to eq(8.5)
  end
end
