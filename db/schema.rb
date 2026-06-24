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

ActiveRecord::Schema[8.1].define(version: 2026_06_22_073435) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "journal_entries", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.date "entry_date"
    t.date "last_updated_date"
    t.string "mood"
    t.string "mood_tag"
    t.boolean "negative_event"
    t.text "negative_event_details"
    t.float "phone_screen_time"
    t.boolean "protine_goal"
    t.string "q1"
    t.string "q2"
    t.string "q3"
    t.string "q4"
    t.boolean "saw_friends_24h"
    t.boolean "self_development"
    t.string "title"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_journal_entries_on_user_id"
  end

  create_table "question_options", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "label"
    t.bigint "question_id", null: false
    t.datetime "updated_at", null: false
    t.string "value"
    t.index ["question_id"], name: "index_question_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.datetime "created_at", null: false
    t.integer "position"
    t.string "response_type"
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date_value"
    t.bigint "journal_entry_id", null: false
    t.integer "numeric_value"
    t.bigint "question_id", null: false
    t.time "screen_time_in_minutes"
    t.string "text_value"
    t.datetime "updated_at", null: false
    t.index ["journal_entry_id"], name: "index_responses_on_journal_entry_id"
    t.index ["question_id"], name: "index_responses_on_question_id"
  end

  create_table "streak_counters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_streak_counters_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "journal_entries", "users"
  add_foreign_key "question_options", "questions"
  add_foreign_key "responses", "journal_entries"
  add_foreign_key "responses", "questions"
  add_foreign_key "streak_counters", "users"
end
