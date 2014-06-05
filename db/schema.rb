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

ActiveRecord::Schema.define(version: 20140603135933) do

  create_table "alipay_notifies", force: true do |t|
    t.boolean  "verify"
    t.text     "params"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "urlname"
    t.string   "status",                  default: "draft"
    t.integer  "save_count",              default: 0
    t.integer  "last_version_save_count", default: 0
    t.datetime "published_at"
    t.string   "token"
    t.integer  "user_id"
    t.integer  "space_id"
    t.integer  "last_edit_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["space_id", "token"], name: "index_articles_on_space_id_and_token", unique: true

  create_table "attachments", force: true do |t|
    t.string   "file"
    t.decimal  "file_size"
    t.string   "token"
    t.integer  "space_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "export_tasks", force: true do |t|
    t.string   "format"
    t.string   "status"
    t.integer  "space_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "import_articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "urlname"
    t.string   "status"
    t.datetime "published_at"
    t.integer  "import_task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "import_tasks", force: true do |t|
    t.string   "format"
    t.string   "status"
    t.string   "file"
    t.integer  "space_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", force: true do |t|
    t.string   "token"
    t.string   "email"
    t.text     "message"
    t.integer  "space_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["space_id", "token"], name: "index_invitations_on_space_id_and_token", unique: true

  create_table "orders", force: true do |t|
    t.string   "plan"
    t.integer  "quantity"
    t.integer  "price",        default: 0
    t.integer  "discount",     default: 0
    t.string   "state",        default: "opening"
    t.datetime "pending_at"
    t.datetime "completed_at"
    t.datetime "canceled_at"
    t.datetime "paid_at"
    t.datetime "start_at"
    t.string   "trade_no"
    t.integer  "space_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["space_id"], name: "index_orders_on_space_id"

  create_table "spaces", force: true do |t|
    t.string   "name"
    t.string   "domain"
    t.string   "disqus_shortname"
    t.string   "google_analytics_id"
    t.string   "full_name"
    t.text     "description"
    t.string   "gravatar_email"
    t.string   "plan",                default: "free"
    t.datetime "plan_expired_at"
    t.integer  "storage_used",        default: 0
    t.integer  "articles_next_id",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "locale",                          default: "zh-CN"
    t.string   "full_name"
    t.text     "description"
    t.string   "password_reset_token"
    t.datetime "password_reset_token_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_spaces", force: true do |t|
    t.integer  "user_id"
    t.integer  "space_id"
    t.integer  "role",       default: 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users_spaces", ["space_id"], name: "index_users_spaces_on_space_id"
  add_index "users_spaces", ["user_id"], name: "index_users_spaces_on_user_id"

  create_table "versions", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "article_id"
    t.integer  "space_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "versions", ["article_id"], name: "index_versions_on_article_id"

end
