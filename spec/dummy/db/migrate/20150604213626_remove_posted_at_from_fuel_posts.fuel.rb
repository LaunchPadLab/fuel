# This migration comes from fuel (originally 20150604161900)
class RemovePostedAtFromFuelPosts < ActiveRecord::Migration
  def change
    remove_column :fuel_posts, :posted_at
  end
end
