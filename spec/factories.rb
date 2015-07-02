require 'faker'

FactoryGirl.define do

  factory :post, class: Fuel::Post do
    published false

    factory :published_post do
      author
      title Faker::Lorem.sentence
      content "<p>Some content for a blog post</p>"
      published true
      published_at { DateTime.now - rand(1..100).days }
    end

    factory :invalid_post do
      published true
      title nil
    end

    factory :unpublished_post do
      published false
    end
  end

  factory :author, class: Fuel::Author do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    title Faker::Name.title
  end

end
