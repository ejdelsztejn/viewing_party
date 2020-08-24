class ViewingPartiesController < ApplicationController
  def new
    movie_data = MovieData.all_data(params[:movie_id])
    @movie = MovieResult.new(movie_data)
  end

  def create
  end
end
