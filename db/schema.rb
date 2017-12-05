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

ActiveRecord::Schema.define(version: 20171105111157) do

  create_table "articlecomments", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.text     "comment_text"
    t.date     "comment_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "title"
    t.string   "subhead"
    t.text     "details"
    t.string   "type"
    t.string   "author"
    t.string   "inputer"
    t.string   "source"
    t.string   "digest",     default: "off"
    t.string   "recommend",  default: "off"
    t.date     "modified"
    t.date     "created"
    t.date     "last_post"
    t.string   "file_path"
    t.string   "image_path"
    t.string   "keyword"
    t.integer  "hits"
    t.integer  "post_num"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.date     "postedtime", default: '2017-11-05'
  end

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid"

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "crypted_password"
    t.string   "qq"
    t.string   "phone"
    t.string   "mail"
    t.string   "salt"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

end
