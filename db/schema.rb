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

ActiveRecord::Schema.define(version: 20171202163214) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "contributors", force: :cascade do |t|
    t.integer  "presentation_id"
    t.string   "name",                   default: "id"
    t.string   "email"
    t.string   "position"
    t.string   "department"
    t.string   "facility"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "questions_count"
    t.integer  "question_ratings_count"
  end

  create_table "insight_types", force: :cascade do |t|
    t.string   "insight_type",   default: "Question"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "insights_count"
  end

  create_table "insights", force: :cascade do |t|
    t.integer  "presentation_id"
    t.integer  "contributor_id"
    t.integer  "insght_type_id"
    t.string   "title",                  default: "Type Title"
    t.string   "body",                   default: "Type Body Here (optional)"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_votes_count"
    t.integer  "question_ratings_count"
    t.integer  "vote_score"
  end

  create_table "leads", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "presentations_count"
    t.index ["email"], name: "index_leads_on_email", unique: true
    t.index ["reset_password_token"], name: "index_leads_on_reset_password_token", unique: true
  end

  create_table "presentations", force: :cascade do |t|
    t.integer  "lead_id"
    t.string   "date"
    t.string   "name",               default: "id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contributors_count"
  end

  create_table "rating_types", force: :cascade do |t|
    t.string   "rating_type",            default: "Letter Grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "question_ratings_count"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "insight_id"
    t.integer  "contributor_id"
    t.integer  "rating_type_id"
    t.string   "rating"
    t.string   "feedback",       default: "Type Specific Feedback Here"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "views", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_views_on_email", unique: true
    t.index ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "insight_id"
    t.integer  "contributor_id"
    t.string   "vote"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
