class Movie < ActiveRecord::Base

  # Associations
  has_many :stars
  has_many :actors, through: :stars
  has_one :directorship
  has_one :actor, through: :directorship
  has_many :screenplays
  has_many :actors, through: :screenplays

  # Accessible Attributes
  attr_accessible :name

  # Validations
  validates :name, presence: true
end
