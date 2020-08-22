require 'rails_helper'

describe MoviesService do
  context "instance methods" do
    context "#movies" do
      it "returns movie data sorted by popularity" do
        service = MoviesService.new
        query = service.movies
        expect(query).to be_a Hash
        expect(query[:results]).to be_an Array
        movie_data = query[:results].first
        expect(movie_data).to have_key :title
        expect(movie_data).to have_key :vote_average
      end
    end
    context "#top_rated_movies" do
      it "returns movie data based on ratings" do
        service = MoviesService.new
        query = service.top_rated_movies
        expect(query).to be_a Hash
        expect(query[:results]).to be_an Array
        movie_data = query[:results].first
        expect(movie_data).to have_key :title
        expect(movie_data).to have_key :vote_average
      end
    end
    context "#search_movies" do
      it "returns movie data based on a keyword search" do
        service = MoviesService.new
        search = service.search_movies("fight")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        movie_data = search[:results].first
        expect(movie_data).to have_key :title
        expect(movie_data).to have_key :vote_average
      end
    end
  end
end
