class ViewParty < ApplicationRecord
  validates_presence_of :movie_title, :duration_of_party, :date, :time
  belongs_to :user
end
