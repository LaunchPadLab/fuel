require "blog_importer.rb"

namespace :fuel do
  desc "This task migrates created_at to published_at as the column is new"
  task :generate_published_at => :environment do
    Fuel::Post.all.each do |post|
      puts "Post: #{post.title}"
      next unless post.published
      puts "migrating published at..."
      post.published_at = post.created_at
      post.save
    end
  end

  desc 'Import blog from CSV'
  task :import_blog => :environment do
    puts "Prior to running: #{Fuel::Post.count} blog posts in database"
    puts "deleting #{Fuel::Post.count} posts..."
    Fuel::Post.destroy_all
    Fuel::Author.destroy_all
    puts "0 posts should remain at this point...#{Fuel::Post.count} actually remain"
    puts "0 authors should remain at this point...#{Fuel::Author.count} actually remain"
    puts "importing new blog posts and authors..."
    BlogImporter.new.pull
    puts "Success! There are now #{Fuel::Post.count} blog posts in database."
  end

  desc "Markdown to HTML"
  task :markdown_to_html => :environment do
    Fuel::Post.all.each do |post|
      post.content = post.content
      post.save
    end
  end

  task :seed => :environment do
    author = Fuel::Author.create(
      first_name: "John",
      last_name: "Doe",
      title: "Developer",
      bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      start_date: Date.today
    )

    post = Fuel::Post.create(
      tag: nil,
      author_id: author.id,
      content: "<h1>My first post</h1>",
      title: "My First Post",
      teaser: "A little teaser to entice people to look at my post",
      published: true,
      published_at: Date.today,
      featured_image: nil,
      seo_title: nil,
      seo_description: nil,
      format: "html"
    )
  end
end
