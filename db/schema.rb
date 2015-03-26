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

ActiveRecord::Schema.define(version: 20150323154050) do

  create_table "memes", force: true do |t|
    t.integer  "topic_id"
    t.string   "title",                     null: false
    t.integer  "likes",         default: 0
    t.integer  "dislikes",      default: 0
    t.string   "src",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_entry_id",             null: false
  end

  add_index "memes", ["topic_id"], name: "index_memes_on_topic_id", using: :btree

  create_table "topics", force: true do |t|
    t.string   "topic_name", limit: 100, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end