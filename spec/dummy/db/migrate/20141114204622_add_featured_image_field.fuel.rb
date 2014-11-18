# This migration comes from fuel (originally 20141114201953)
class AddFeaturedImageField < ActiveRecord::Migration
  def change
    add_column :fuel_posts, :featured_image_url, :string
  end
end
