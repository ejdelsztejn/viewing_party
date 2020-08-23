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
    context "#general_movie_details" do
      it "returns movie data based on a keyword search" do
        service = MoviesService.new
        search_movie_details = service.general_movie_details("278")
        expect(search_movie_details).to be_a Hash
        expect(search_movie_details).to have_key :id
        expect(search_movie_details).to have_key :title
        expect(search_movie_details).to have_key :vote_average
        expect(search_movie_details).to have_key :runtime
        expect(search_movie_details).to have_key :genres
        expect(search_movie_details[:genres]).to be_a Array
        expect(search_movie_details[:genres].first).to be_a Hash
      end
    end
    context "#movie_reviews" do
      it "returns movie data based on a keyword search" do
        service = MoviesService.new
        search_reviews = service.movie_reviews("278")
        expect(search_reviews).to be_a Hash
        expect(search_reviews[:results]).to be_an Array
        review_data = search_reviews[:results].first
        expect(review_data).to have_key :author
        expect(review_data).to have_key :content
      end
    end
    context "#movie_cast" do
      it "returns movie data based on a keyword search" do
        service = MoviesService.new
        search_cast = service.movie_cast("278")
        expect(search_cast).to be_a Hash
        expect(search_cast[:cast]).to be_an Array
        cast_data = search_cast[:cast].first
        expect(cast_data).to have_key :name
      end
    end
  end
end
