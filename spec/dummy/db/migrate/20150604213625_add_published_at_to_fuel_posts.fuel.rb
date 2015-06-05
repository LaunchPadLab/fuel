# This migration comes from fuel (originally 20150604155028)
class AddPublishedAtToFuelPosts < ActiveRecord::Migration
  def change
    add_column :fuel_posts, :published_at, :datetime
  end
end
