# This migration comes from fuel (originally 20150608221309)
class AddStartDateToAuthors < ActiveRecord::Migration
  def change
    add_column :fuel_authors, :start_date, :date
  end
end
