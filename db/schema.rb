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

ActiveRecord::Schema.define(version: 20141128223801) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "workout_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "diagram_file_name"
    t.string   "diagram_content_type"
    t.integer  "diagram_file_size"
    t.datetime "diagram_updated_at"
  end

  create_table "histories", force: true do |t|
    t.integer  "subscription_id"
    t.integer  "exercise_id"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reps"
    t.integer  "sets"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "workout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.integer  "workout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "complete",    default: false
    t.datetime "start_time"
    t.datetime "finish_time"
    t.date     "schedule"
  end

  create_table "users", force: true do |t|
    t.string   "email",                    default: "",    null: false
    t.string   "encrypted_password",       default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                    default: false
    t.string   "username"
    t.string   "paypal_customer_token"
    t.string   "paypal_recurring_profile"
    t.string   "paypal_payment_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "warmups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warmworks", force: true do |t|
    t.integer  "warmup_id"
    t.integer  "workout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weeklybits", force: true do |t|
    t.integer  "weeklyplan_id"
    t.integer  "workout_id"
    t.integer  "day"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weeklyplans", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",     default: true
  end

  create_table "workoutbits", force: true do |t|
    t.integer  "workout_id"
    t.integer  "exercise_id"
    t.integer  "sets"
    t.integer  "reps"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restime"
  end

  create_table "workouts", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "weightFacility"
  end

end
