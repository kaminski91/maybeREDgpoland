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

ActiveRecord::Schema.define(version: 20150621045124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "galleries", force: :cascade do |t|
    t.string   "name"
    t.boolean  "rotator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "galleries", ["name"], name: "index_galleries_on_name", unique: true, using: :btree

  create_table "gallery_images", force: :cascade do |t|
    t.integer  "gallery_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_index "gallery_images", ["gallery_id"], name: "index_gallery_images_on_gallery_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.date     "date"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.text     "startText"
    t.text     "aboutText"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "madeInGText"
    t.text     "retailAcademyText"
    t.text     "carieerText"
    t.text     "contactText"
  end

  create_table "portfolios", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "brand_file_name"
    t.string   "brand_content_type"
    t.integer  "brand_file_size"
    t.datetime "brand_updated_at"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.string   "title"
    t.text     "content"
    t.string   "url"
  end

  create_table "salons", force: :cascade do |t|
    t.string   "brand"
    t.float    "posX"
    t.float    "posY"
    t.text     "description"
    t.string   "country"
    t.string   "city"
    t.string   "address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  create_table "showrooms", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_foreign_key "gallery_images", "galleries"
end
