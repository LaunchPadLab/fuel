class AddFormatToFuelPosts < ActiveRecord::Migration
  def change
    add_column :fuel_posts, :format, :string, default: "html"
  end
end
