# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_23_140015) do

  create_table "comments", charset: "utf8mb4", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.integer "post_review_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likes", charset: "utf8mb4", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_review_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "post_review_id"], name: "index_likes_on_user_id_and_post_review_id", unique: true
  end

  create_table "post_reviews", charset: "utf8mb4", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "sake_image_name"
    t.string "sake_type"
    t.string "sake_maker"
    t.string "sake_name"
    t.string "sake_price"
    t.float "sake_rate", default: 0.0, null: false
    t.string "sake_amount"
    t.integer "sake_id"
    t.index ["user_id", "created_at"], name: "index_post_reviews_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_post_reviews_on_user_id"
  end

  create_table "relationships", charset: "utf8mb4", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "sakes", charset: "utf8mb4", force: :cascade do |t|
    t.string "sake_name"
    t.string "sake_image"
    t.string "sake_type"
    t.string "sake_maker"
    t.string "sake_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "post_review_id"
    t.index ["sake_name"], name: "index_sakes_on_sake_name"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "image_name"
    t.text "self_introduction"
    t.string "remember_digest"
    t.string "cover_image_name"
    t.boolean "admin", default: false
    t.string "comment"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "post_reviews", "users"
end
