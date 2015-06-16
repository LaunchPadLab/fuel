# This migration comes from fuel (originally 20140122011655)
class CreateFuelPosts < ActiveRecord::Migration
  def change
    create_table :fuel_posts do |t|
      t.string :tag
      t.string :author
      t.text :content
      t.string :title
      t.string :slug
      t.boolean :published, default: true

      t.timestamps
    end
    add_index :fuel_posts, :slug, unique: true
  end
end
