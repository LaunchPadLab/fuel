# namespace :fuel do
#   desc "This task migrates created_at to published_at as the column is new"
#   task :generate_published_at do
#     Fuel::Post.all.each do |post|
#       next unless post.published
#       post.published_at = post.created_at
#       post.save
#     end
#   end
# end