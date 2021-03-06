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

ActiveRecord::Schema.define(version: 20150723124451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "downloads", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "downloads", ["user_id"], name: "index_downloads_on_user_id", using: :btree

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

  create_table "made_in_gs", force: :cascade do |t|
    t.text     "content_pl"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.text     "content_en"
    t.text     "content_it"
  end

  create_table "news", force: :cascade do |t|
    t.date     "date"
    t.text     "content_pl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "content_en"
    t.text     "content_it"
    t.string   "title_pl"
    t.string   "title_en"
    t.string   "title_it"
    t.text     "short_pl"
    t.text     "short_en"
    t.text     "short_it"
    t.boolean  "active"
  end

  create_table "news_images", force: :cascade do |t|
    t.integer  "news_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_index "news_images", ["news_id"], name: "index_news_images_on_news_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.text     "startText_pl"
    t.text     "aboutText_pl"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "retailAcademyText_pl"
    t.text     "carieerText_pl"
    t.text     "contactText_pl"
    t.text     "startText_en"
    t.text     "startText_it"
    t.text     "aboutText_en"
    t.text     "aboutText_it"
    t.text     "retailAcademyText_en"
    t.text     "retailAcademyText_it"
    t.text     "carieerText_en"
    t.text     "carieerText_it"
    t.text     "contactText_en"
    t.text     "contactText_it"
    t.string   "retail_img_file_name"
    t.string   "retail_img_content_type"
    t.integer  "retail_img_file_size"
    t.datetime "retail_img_updated_at"
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
    t.string   "title_pl"
    t.text     "content_pl"
    t.string   "www"
    t.string   "title_en"
    t.string   "title_it"
    t.text     "content_en"
    t.text     "content_it"
    t.integer  "np"
  end

  add_index "portfolios", ["np"], name: "index_portfolios_on_np", using: :btree

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
    t.text     "content_pl"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
    t.text     "content_en"
    t.text     "content_it"
  end

  create_table "translations", force: :cascade do |t|
    t.string   "startMore_pl"
    t.string   "startMore_en"
    t.string   "startMore_it"
    t.string   "aboutHeader_pl"
    t.string   "aboutHeader_en"
    t.string   "aboutHeader_it"
    t.string   "portfolioHeader_pl"
    t.string   "portfolioHeader_en"
    t.string   "portfolioHeader_it"
    t.string   "portfolioMore_pl"
    t.string   "portfolioMore_en"
    t.string   "portfolioMore_it"
    t.string   "carieerHeader_pl"
    t.string   "carieerHeader_en"
    t.string   "carieerHeader_it"
    t.string   "contactHeader_pl"
    t.string   "contactHeader_en"
    t.string   "contactHeader_it"
    t.string   "contactFollow_pl"
    t.string   "contactFollow_en"
    t.string   "contactFollow_it"
    t.string   "formName_pl"
    t.string   "formName_en"
    t.string   "formName_it"
    t.string   "formEmail_pl"
    t.string   "formEmail_en"
    t.string   "formEmail_it"
    t.string   "formTel_pl"
    t.string   "formTel_en"
    t.string   "formTel_it"
    t.string   "formContent_pl"
    t.string   "formContent_en"
    t.string   "formContent_it"
    t.string   "salonHeader_pl"
    t.string   "salonHeader_en"
    t.string   "salonHeader_it"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "portfolioMenu_pl"
    t.string   "portfolioMenu_en"
    t.string   "portfolioMenu_it"
    t.string   "formSend_pl"
    t.string   "formSend_en"
    t.string   "formSend_it"
    t.string   "formPass_pl"
    t.string   "formPass_en"
    t.string   "formPass_it"
    t.string   "formLogin_pl"
    t.string   "formLogin_en"
    t.string   "formLogin_it"
    t.string   "downloadHeader_pl"
    t.string   "downloadHeader_en"
    t.string   "downloadHeader_it"
    t.string   "contactMenu_pl"
    t.string   "contactMenu_en"
    t.string   "contactMenu_it"
    t.string   "newsHeader_pl"
    t.string   "newsHeader_en"
    t.string   "newsHeader_it"
    t.string   "map_pl"
    t.string   "map_en"
    t.string   "map_it"
    t.string   "salonText_pl"
    t.string   "salonText_en"
    t.string   "salonText_it"
    t.string   "salonFilter_pl"
    t.string   "salonFilter_en"
    t.string   "salonFilter_it"
    t.string   "salonFilterCountry_pl"
    t.string   "salonFilterCountry_en"
    t.string   "salonFilterCountry_it"
    t.string   "salonFilterCity_pl"
    t.string   "salonFilterCity_en"
    t.string   "salonFilterCity_it"
    t.string   "salonFilterBrand_pl"
    t.string   "salonFilterBrand_en"
    t.string   "salonFilterBrand_it"
    t.string   "salonFilterLocalization_pl"
    t.string   "salonFilterLocalization_en"
    t.string   "salonFilterLocalization_it"
    t.string   "salonFilterAll_pl"
    t.string   "salonFilterAll_en"
    t.string   "salonFilterAll_it"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "downloads", "users"
  add_foreign_key "gallery_images", "galleries"
  add_foreign_key "news_images", "news"
end
