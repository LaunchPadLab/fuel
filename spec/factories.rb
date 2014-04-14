FactoryGirl.define do

  factory :post, class: Fuel::Post do
    title "This is a title"
    author "Ryan Francis"
    tag "Coding"
    content "Some content for a blog post"
    published true
  end

end
