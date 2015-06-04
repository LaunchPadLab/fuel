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
end