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

ActiveRecord::Schema.define(version: 2022_03_01_135824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "approval_flows", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.bigint "proposal_id", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["proposal_id"], name: "index_approval_flows_on_proposal_id"
    t.index ["user_id"], name: "index_approval_flows_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "step_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["step_id"], name: "index_comments_on_step_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "step_id", null: false
    t.string "original_status"
    t.string "updated_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["step_id"], name: "index_logs_on_step_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "scope"
    t.float "budget"
    t.date "due_date"
    t.bigint "user_id", null: false
    t.boolean "archive", default: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "approval_flow_id", null: false
    t.bigint "user_id", null: false
    t.string "status", default: "created"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["approval_flow_id"], name: "index_steps_on_approval_flow_id"
    t.index ["user_id"], name: "index_steps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "approval_flows", "proposals"
  add_foreign_key "approval_flows", "users"
  add_foreign_key "comments", "steps"
  add_foreign_key "comments", "users"
  add_foreign_key "logs", "steps"
  add_foreign_key "proposals", "users"
  add_foreign_key "steps", "approval_flows"
  add_foreign_key "steps", "users"
end
