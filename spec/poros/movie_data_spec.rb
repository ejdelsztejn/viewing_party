require 'rails_helper'

describe MovieData do
  context "class methods" do
    before :each do
      @movie_id = "278"
    end
    context ".all_data" do
      it "returns convergence of all data about a movie" do
        VCR.use_cassette('top_rated_movies, general_movie_details, movie_cast, movie_reviews') do
          all_data = MovieData.all_data(@movie_id)
          expect(all_data).to be_a Hash
          expect(all_data).to have_key :id
          expect(all_data).to have_key :title
          expect(all_data).to have_key :vote_average
          expect(all_data).to have_key :runtime
          expect(all_data).to have_key :summary
          expect(all_data).to have_key :genres
          expect(all_data).to have_key :reviews
          expect(all_data).to have_key :cast
        end
      end
    end

    context ".general_info" do
      it "returns just the general info about a movie" do
        VCR.use_cassette('general_movie_details') do
          general_info = MovieData.general_info(@movie_id)
          expect(general_info).to be_a Hash
          expect(general_info).to have_key :id
          expect(general_info).to have_key :original_title
          expect(general_info).to have_key :vote_average
          expect(general_info).to have_key :runtime
          expect(general_info).to have_key :overview
          expect(general_info).to have_key :genres
        end
      end
    end

    context ".reviews" do
      it "returns the review data about a movie" do
        VCR.use_cassette('movie_reviews') do
          review_data = MovieData.reviews(@movie_id)
          expect(review_data).to be_a Hash
          expect(review_data).to have_key :results
        end
      end
    end

    context ".cast" do
      it "returns the cast data for a movie" do
        VCR.use_cassette('movie_cast') do
          cast_data = MovieData.cast(@movie_id)
          expect(cast_data).to be_a Hash
          expect(cast_data).to have_key :cast
        end
      end
    end
  end
end
