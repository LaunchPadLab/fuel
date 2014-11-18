class AddTeaserToPosts < ActiveRecord::Migration
  def change
    add_column :fuel_posts, :teaser, :text
  end
end
