class AddAuthorIdToPosts < ActiveRecord::Migration
  def change
    add_column :fuel_posts, :author_id, :integer
  end
end
