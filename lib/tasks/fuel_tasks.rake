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
end