# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_19_114857) do

  create_table "bookmarks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "test_id"
    t.index ["test_id", "user_id"], name: "index_bookmarks_on_test_id_and_user_id"
    t.index ["user_id", "test_id"], name: "index_bookmarks_on_user_id_and_test_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "language_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer "test_id", null: false
    t.text "content"
    t.text "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "test_record_questions", force: :cascade do |t|
    t.integer "test_record_id", null: false
    t.integer "question_id", null: false
    t.integer "number_passed"
    t.integer "number_failed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_test_record_questions_on_question_id"
    t.index ["test_record_id"], name: "index_test_record_questions_on_record_id"
  end

  create_table "test_records", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "test_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["test_id"], name: "index_test_records_on_test_id"
    t.index ["user_id"], name: "index_test_records_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "language_id", null: false
    t.integer "category_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_tests_on_category_id"
    t.index ["language_id"], name: "index_tests_on_language_id"
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "auth_token"
    t.string "role", default: "member"
    t.string "name"
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "questions", "tests"
  add_foreign_key "test_record_questions", "questions"
  add_foreign_key "test_record_questions", "test_records"
  add_foreign_key "test_records", "tests"
  add_foreign_key "test_records", "users"
  add_foreign_key "tests", "categories"
  add_foreign_key "tests", "languages"
  add_foreign_key "tests", "users"
end
