class RemovePostedAtFromFuelPosts < ActiveRecord::Migration
  def change
    remove_column :fuel_posts, :posted_at
  end
end
