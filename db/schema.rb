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

ActiveRecord::Schema.define(version: 2020_04_20_170023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreements", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.float "cost"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "service_id", null: false
    t.index ["service_id"], name: "index_agreements_on_service_id"
    t.index ["user_id"], name: "index_agreements_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.float "percentage"
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_experiences_on_vendor_id"
  end

  create_table "recomendations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "contact"
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_recomendations_on_vendor_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "amount"
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_services_on_vendor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "vendor_requests", force: :cascade do |t|
    t.string "status", null: false
    t.text "feedback"
    t.bigint "vendor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vendor_id"], name: "index_vendor_requests_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "ruc"
    t.string "economic_activity"
    t.string "contributor_type"
    t.string "legal_representative"
    t.string "business_name"
    t.string "image"
    t.string "logo"
    t.string "slogan"
    t.string "mobile"
    t.boolean "active", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_vendors_on_category_id"
    t.index ["user_id"], name: "index_vendors_on_user_id"
  end

  add_foreign_key "agreements", "services"
  add_foreign_key "agreements", "users"
  add_foreign_key "experiences", "vendors"
  add_foreign_key "recomendations", "vendors"
  add_foreign_key "services", "vendors"
  add_foreign_key "vendor_requests", "vendors"
  add_foreign_key "vendors", "categories"
  add_foreign_key "vendors", "users"
end
