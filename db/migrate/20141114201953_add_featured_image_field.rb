class AddFeaturedImageField < ActiveRecord::Migration
  def change
    add_column :fuel_posts, :featured_image_url, :string
  end
end
