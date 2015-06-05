require 'open-uri'
require 'example_author'

class BlogImporter

  DEFAULT_API_ADDRESS = "http://launchpadlab.com/api/posts.json"

  attr_reader :api_url
  attr_accessor :parsed_json

  def initialize(args = {})
    @api_url = args.fetch(:api_url, DEFAULT_API_ADDRESS)
  end

  def pull
    create_authors
    open(api_url) do |f|
      json_string = f.read
      @parsed_json = JSON.parse(json_string)
    end
    add_posts_to_db
  end

  def add_posts_to_db
    parsed_json.each do |post|
      puts "Importing #{post['title']}"
      post.delete("id")
      author_name = post["author"].dup
      image_url = post["prioritized_featured_image_url"].present? ? post["prioritized_featured_image_url"].dup : nil
      post.delete("prioritized_featured_image_url")
      member = author_name_to_member[author_name]
      author = Fuel::Author.find_by_email(member[:email])
      post["author_id"] = author.id
      post.delete("author")
      new_post = Fuel::Post.new(post)
      new_post.featured_image = URI.parse(image_url) if image_url.present?
      new_post.published_at = post["created_at"] if new_post.published
      puts new_post.published_at
      new_post.save
    end
  end

  def author_name_to_member
    @key_to_member ||= {
      "BH" => ExampleAuthor::BRENDAN,
      "Brendan" => ExampleAuthor::BRENDAN,
      "Tom" => ExampleAuthor::TOM,
      "TC" => ExampleAuthor::TOM,
      "Ryan" => ExampleAuthor::RYAN,
      "Scott" => ExampleAuthor::SCOTT,
      "Kurt" => ExampleAuthor::KURT,
      "Katie" => ExampleAuthor::KATIE,
      "Scott " => ExampleAuthor::SCOTT,
      "Monique" => ExampleAuthor::MONIQUE,
      "Jack " => ExampleAuthor::JACK,
      "Dave" => ExampleAuthor::DAVE
    }
  end

  def create_authors
    [ExampleAuthor::BRENDAN, ExampleAuthor::TOM, ExampleAuthor::RYAN, ExampleAuthor::SCOTT, ExampleAuthor::KURT, ExampleAuthor::DAVE, ExampleAuthor::KATIE, ExampleAuthor::MONIQUE, ExampleAuthor::JACK].each do |member_const|
      member = member_const.dup
      author = Fuel::Author.find_by_email(member["email"])
      next if author.present?
      image_path = member[:image_path].dup
      member.delete(:image_path)
      member.delete(:image_alt)
      new_author = Fuel::Author.new(member)

      avatar_location = "#{Rails.root}/app/assets/images/#{image_path}"
      puts avatar_location
      file = File.open(avatar_location)
      new_author.avatar = file
      file.close

      puts "creating new author..."
      new_author.save!
      puts "Author #{Fuel::Author.count} created."
    end
  end

end