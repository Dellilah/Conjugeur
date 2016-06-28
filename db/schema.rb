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

ActiveRecord::Schema.define(version: 20160522182427) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "personal_exercise_sets", force: :cascade do |t|
    t.text    "excluded_verbs_ids"
    t.text    "included_verbs_ids"
    t.text    "tenses_ids"
    t.text    "groups"
    t.integer "user_id"
    t.string  "name"
  end

  add_index "personal_exercise_sets", ["user_id"], name: "index_personal_exercise_sets_on_user_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "user_repetitions", force: :cascade do |t|
    t.decimal  "easiness_factor",          default: 2.5
    t.integer  "number_repetitions",       default: 0
    t.integer  "quality_of_last_recall"
    t.datetime "next_repetition",          default: '2016-05-22 00:00:00'
    t.integer  "repetition_interval"
    t.datetime "last_studied"
    t.integer  "user_id"
    t.integer  "personal_exercise_set_id"
    t.integer  "form_id"
  end

  add_index "user_repetitions", ["personal_exercise_set_id"], name: "index_user_repetitions_on_personal_exercise_set_id", using: :btree
  add_index "user_repetitions", ["user_id"], name: "index_user_repetitions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "personal_exercise_sets", "users"
  add_foreign_key "user_repetitions", "personal_exercise_sets"
  add_foreign_key "user_repetitions", "users"
end
