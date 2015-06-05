# This migration comes from fuel (originally 20150530180444)
class AddAuthorIdToPosts < ActiveRecord::Migration
  def change
    add_column :fuel_posts, :author_id, :integer
  end
end
