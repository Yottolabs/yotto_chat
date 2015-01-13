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

ActiveRecord::Schema.define(version: 20150110094125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_que_customers", force: true do |t|
    t.integer  "customer_id"
    t.integer  "chat_que_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_id"
  end

  add_index "chat_que_customers", ["chat_que_id"], name: "index_chat_que_customers_on_chat_que_id", using: :btree
  add_index "chat_que_customers", ["customer_id"], name: "index_chat_que_customers_on_customer_id", using: :btree

  create_table "chat_ques", force: true do |t|
    t.string   "name"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "skill_set_id"
  end

  create_table "conversations", force: true do |t|
    t.integer  "chat_que_customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_id"
  end

  add_index "conversations", ["chat_que_customer_id"], name: "index_conversations_on_chat_que_customer_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "mobile_no"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.text     "content_text"
    t.integer  "conversation_id"
    t.integer  "participant_id"
    t.string   "participant_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["participant_id"], name: "index_messages_on_participant_id", using: :btree

  create_table "skill_sets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "skill_sets_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "skill_set_id"
  end

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
  end

end
