require 'spec_helper'

describe Actor do

  before do
    @actor = Actor.new(name: 'Jim Henson')
  end

  subject { @actor }

  it 'is valid with a name' do
    expect(subject).to be_valid
  end

  it 'is invalid without a name' do
    subject.name = nil
    expect(subject).to have(1).errors_on(:name)
  end

  # Attributes
  it 'responds to name' do
    expect(subject).to respond_to(:name)
  end

  # Association with Star Model
  it 'responds to star' do
    expect(subject).to respond_to(:stars)
  end

  it 'responds to character in star' do
    expect(subject.stars.new).to respond_to(:character)
  end

  # Association with Movie Model
  it 'responds to movie' do
    expect(subject).to respond_to(:movies)
  end

  # Association with Directorship Model
  it 'responds to directorship'do
    expect(subject).to respond_to(:directorships)
  end

  # Association with Screenplay Model
  it 'responds to screenplays' do
    expect(subject).to respond_to(:screenplays)
  end
end
