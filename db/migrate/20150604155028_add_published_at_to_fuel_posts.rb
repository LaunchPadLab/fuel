class AddPublishedAtToFuelPosts < ActiveRecord::Migration
  def change
    add_column :fuel_posts, :published_at, :datetime
  end
end
