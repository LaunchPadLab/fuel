# This migration comes from fuel (originally 20141217174229)
class AddFeaturedImageToPosts < ActiveRecord::Migration

  def self.up
    add_attachment :fuel_posts, :featured_image
  end

  def self.down
    remove_attachment :fuel_posts, :featured_image
  end
end
