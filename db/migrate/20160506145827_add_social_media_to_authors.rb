class AddSocialMediaToAuthors < ActiveRecord::Migration
  def change
    add_column :fuel_authors, :instagram, :string
    add_column :fuel_authors, :medium, :string
    add_column :fuel_authors, :personal_site, :string
    add_column :fuel_authors, :linkedin, :string
  end
end
