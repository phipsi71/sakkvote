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

ActiveRecord::Schema.define(version: 20140415090850) do

  create_table "answers", force: true do |t|
    t.boolean  "answer"
    t.integer  "question_id"
    t.string   "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries", force: true do |t|
    t.string   "answer"
    t.string   "remark"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_id"
    t.integer  "question_id"
  end

  create_table "questions", force: true do |t|
    t.string  "poke"
    t.boolean "is_active", default: false
    t.integer "nof_votes"
    t.text    "condition"
  end

  create_table "trials", force: true do |t|
    t.decimal  "trl_code"
    t.string   "trl_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "voters", force: true do |t|
    t.string   "session_id"
    t.datetime "logon_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
