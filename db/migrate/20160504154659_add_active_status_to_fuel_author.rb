class AddActiveStatusToFuelAuthor < ActiveRecord::Migration
  def change
    add_column :fuel_authors, :is_active, :boolean, default: true
  end
end
