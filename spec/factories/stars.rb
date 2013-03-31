# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :star do
    actor_id 1
    movie_id 1
    character "MyString"
  end
end
