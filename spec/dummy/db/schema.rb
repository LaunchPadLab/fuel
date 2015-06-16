# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150616184619) do

  create_table "fuel_authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.text     "bio"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "twitter"
    t.string   "github"
    t.string   "dribbble"
    t.date     "start_date"
  end

  create_table "fuel_posts", force: :cascade do |t|
    t.string   "tag"
    t.string   "author"
    t.text     "content"
    t.string   "title"
    t.string   "slug"
    t.boolean  "published",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "featured_image_url"
    t.text     "teaser"
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.string   "seo_title"
    t.text     "seo_description"
    t.integer  "author_id"
    t.datetime "published_at"
  end

  add_index "fuel_posts", ["slug"], name: "index_fuel_posts_on_slug", unique: true

end
