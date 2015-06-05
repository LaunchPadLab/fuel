# require "blog_importer.rb"

# desc 'Import blog from CSV'
# task :import_blog => :environment do
#   puts "Prior to running: #{Fuel::Post.count} blog posts in database"
#   puts "deleting #{Fuel::Post.count} posts..."
#   Fuel::Post.destroy_all
#   puts "0 should remain at this point...#{Fuel::Post.count} actually remain"
#   puts "importing new blog posts..."
#   BlogImporter.new.pull
#   puts "Success! There are now #{Fuel::Post.count} blog posts in database."
# end

