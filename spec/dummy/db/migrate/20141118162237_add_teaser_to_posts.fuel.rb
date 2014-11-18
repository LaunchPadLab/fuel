# This migration comes from fuel (originally 20141118162158)
class AddTeaserToPosts < ActiveRecord::Migration
  def change
    add_column :fuel_posts, :teaser, :text
  end
end
