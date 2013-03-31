# Connects Actors with the movies that they
# have directed.
class Directorship < ActiveRecord::Base

  # Associations
  belongs_to :actor
  belongs_to :movie

  # Accessible Attributes
  attr_accessible :actor_id, :movie_id

  # Validations
  validates :actor_id, presence: true
  validates :movie_id, presence: true
end
