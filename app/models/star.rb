# Connects Actors with the Movies that they
# have starred in and includes the names of
# their characters.
class Star < ActiveRecord::Base

  # Associations
  belongs_to :actor
  belongs_to :movie

  # Accessible Attributes
  attr_accessible :actor_id, :character, :movie_id

  # Validations
  validates :actor_id, presence: true
  validates :character, presence: true
  validates :movie_id, presence: true
end
