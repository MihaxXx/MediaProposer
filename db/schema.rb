# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_22_132625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "genre", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "URL"
    t.bigint "users_id"
    t.bigint "media_id"
    t.index ["media_id"], name: "index_images_on_media_id"
    t.index ["users_id"], name: "index_images_on_users_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "name", null: false
    t.string "origin_name", null: false
    t.text "desc"
    t.decimal "rating", precision: 3, scale: 3
    t.string "type", null: false
    t.date "release"
    t.bigint "image_id"
    t.index ["image_id"], name: "index_media_on_image_id"
  end

  create_table "mediagenre", force: :cascade do |t|
    t.bigint "media_id"
    t.bigint "genre_id"
    t.index ["genre_id"], name: "index_mediagenre_on_genre_id"
    t.index ["media_id"], name: "index_mediagenre_on_media_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "users_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "media_id"
    t.index ["media_id"], name: "index_reviews_on_media_id"
    t.index ["users_id"], name: "index_reviews_on_users_id"
  end

  create_table "usermedia", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "media_id", null: false
    t.index ["media_id"], name: "index_usermedia_on_media_id"
    t.index ["user_id"], name: "index_usermedia_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
    t.string "password", null: false
    t.string "email", null: false
  end

end
