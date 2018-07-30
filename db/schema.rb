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

ActiveRecord::Schema.define(version: 2018_07_30_205121) do

  create_table "comments", force: :cascade do |t|
    t.integer "favor_id"
    t.integer "user_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favors", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "requester_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "rating"
    t.integer "favor_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favor_id"], name: "index_reviews_on_favor_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "user_favors", force: :cascade do |t|
    t.integer "requester_id"
    t.integer "requestee_id"
    t.integer "favor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favor_id"], name: "index_user_favors_on_favor_id"
    t.index ["requestee_id"], name: "index_user_favors_on_requestee_id"
    t.index ["requester_id"], name: "index_user_favors_on_requester_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
