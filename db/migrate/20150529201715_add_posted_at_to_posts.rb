class AddPostedAtToPosts < ActiveRecord::Migration
  def change
    add_column :fuel_posts, :posted_at, :datetime
  end
end
