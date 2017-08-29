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

ActiveRecord::Schema.define(version: 20170829094238) do

  create_table "groups", force: :cascade do |t|
    t.string   "group_name",      limit: 255, null: false
    t.string   "group_image_url", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "group_id",   limit: 4, null: false
    t.integer  "user_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "members", ["group_id"], name: "index_members_on_group_id", using: :btree
  add_index "members", ["user_id"], name: "index_members_on_user_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "group_id",     limit: 4, null: false
    t.integer  "user_id",      limit: 4, null: false
    t.integer  "requester_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "requests", ["group_id"], name: "index_requests_on_group_id", using: :btree
  add_index "requests", ["user_id"], name: "index_requests_on_user_id", using: :btree

  create_table "tweets", force: :cascade do |t|
    t.integer  "group_id",   limit: 4,   null: false
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "text",       limit: 255, null: false
    t.string   "image_url",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tweets", ["group_id"], name: "index_tweets_on_group_id", using: :btree
  add_index "tweets", ["user_id"], name: "index_tweets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",     limit: 255,   null: false
    t.string   "uid",          limit: 255,   null: false
    t.string   "user_name",    limit: 255,   null: false
    t.string   "account_name", limit: 255
    t.string   "image_url",    limit: 255,   null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "description",  limit: 65535
    t.string   "banner_url",   limit: 255
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

  add_foreign_key "members", "groups"
  add_foreign_key "members", "users"
  add_foreign_key "requests", "groups"
  add_foreign_key "requests", "users"
  add_foreign_key "tweets", "groups"
  add_foreign_key "tweets", "users"
end
