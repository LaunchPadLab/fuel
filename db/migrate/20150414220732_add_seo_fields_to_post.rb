class AddSeoFieldsToFuelPost < ActiveRecord::Migration
  def change
    add_column :fuel_posts, :seo_title, :string
    add_column :fuel_posts, :seo_description, :text
  end
end
