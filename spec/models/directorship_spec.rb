require 'spec_helper'

describe Directorship do

  before do
    actor = Actor.create(name: 'Jim Henson')
    movie = Movie.create(name: 'Muppet Movie')
    @directorship = Directorship.new(actor_id: actor.id, movie_id: movie.id)
  end

  subject { @directorship }

  it 'is valid with an actor_id and movie_id' do
    expect(subject).to be_valid
  end

  it 'is invalid without an actor_id' do
    subject.actor_id = nil
    expect(subject).to have(1).error_on(:actor_id)
  end

  it 'is invalid without a movie_id' do
    subject.movie_id = nil
    expect(subject).to have(1).error_on(:movie_id)
  end

  # Attributes
  it 'responds to actor_id' do
    expect(subject).to respond_to(:actor_id)
  end

  it 'responds to movie_id' do
    expect(subject).to respond_to(:movie_id)
  end

  # Association with Actor Model
  it 'responds to actor' do
    expect(subject).to respond_to(:actor)
  end

  # Association with Movie Model
  it 'responds to movie' do
    expect(subject).to respond_to(:movie)
  end
end
