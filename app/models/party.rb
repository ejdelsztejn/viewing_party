class Party < ApplicationRecord
  validates_presence_of :movie_title, :duration_of_party, :start_time, :end_time
  belongs_to :user
end
