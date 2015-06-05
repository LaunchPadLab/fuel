# This migration comes from fuel (originally 20150529202105)
class CreateFuelAuthors < ActiveRecord::Migration
  def change
    create_table :fuel_authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :title
      t.text :bio
      t.attachment :avatar

      t.timestamps
    end
  end
end
