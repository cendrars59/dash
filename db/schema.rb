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

ActiveRecord::Schema.define(version: 20160922194729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "log_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["log_id"], name: "index_comments_on_log_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "log_added_values", force: :cascade do |t|
    t.string   "code"
    t.string   "label"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "log_stages", force: :cascade do |t|
    t.string   "code"
    t.string   "label"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "log_statuses", force: :cascade do |t|
    t.string   "code"
    t.string   "label"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "log_types", force: :cascade do |t|
    t.string   "code"
    t.string   "label"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string   "code"
    t.string   "label"
    t.text     "description"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "log_stage_id"
    t.integer  "log_status_id"
    t.integer  "log_type_id"
    t.integer  "log_added_value_id"
    t.text     "expectation"
    t.integer  "creator_id"
    t.integer  "owner_id"
    t.integer  "expected_milestone_id"
    t.integer  "confirmed_milestone_id"
    t.index ["log_added_value_id"], name: "index_logs_on_log_added_value_id", using: :btree
    t.index ["log_stage_id"], name: "index_logs_on_log_stage_id", using: :btree
    t.index ["log_status_id"], name: "index_logs_on_log_status_id", using: :btree
    t.index ["log_type_id"], name: "index_logs_on_log_type_id", using: :btree
  end

  create_table "milestones", force: :cascade do |t|
    t.string   "code"
    t.string   "label"
    t.text     "description"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "alias"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "logs"
  add_foreign_key "comments", "users"
  add_foreign_key "logs", "log_added_values"
  add_foreign_key "logs", "log_stages"
  add_foreign_key "logs", "log_statuses"
  add_foreign_key "logs", "log_types"
end
