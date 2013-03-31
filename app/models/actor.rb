class Actor < ActiveRecord::Base

  # Associations
  has_many :stars
  has_many :movies, through: :stars
  has_many :directorships
  has_many :movies, through: :directorships
  has_many :screenplays
  has_many :movies, through: :screenplays

  # Accessible attributes
  attr_accessible :name

  # Validations
  validates :name, presence: true
end
