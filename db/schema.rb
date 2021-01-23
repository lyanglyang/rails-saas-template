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

ActiveRecord::Schema.define(version: 2021_01_22_193602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :serial, force: :cascade do |t|
    t.string "company_name", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.integer "plan_id", null: false
    t.integer "paused_plan_id"
    t.boolean "active", default: true, null: false
    t.string "address_line1", limit: 120
    t.string "address_line2", limit: 120
    t.string "address_city", limit: 120
    t.string "address_zip", limit: 20
    t.string "address_state", limit: 60
    t.string "address_country", limit: 2
    t.string "card_token", limit: 60
    t.string "stripe_customer_id", limit: 60
    t.string "stripe_subscription_id", limit: 60
    t.string "cancellation_message"
    t.datetime "cancelled_at"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "hostname", limit: 255
    t.string "subdomain", limit: 64
    t.string "custom_path", limit: 60
    t.string "card_brand", limit: 25
    t.string "card_last4", limit: 4
    t.string "card_exp", limit: 7
    t.integer "cancellation_category_id"
    t.integer "cancellation_reason_id"
    t.index ["cancellation_category_id"], name: "index_accounts_on_cancellation_category_id"
    t.index ["cancellation_reason_id"], name: "index_accounts_on_cancellation_reason_id"
    t.index ["custom_path"], name: "index_accounts_on_custom_path", unique: true
    t.index ["email"], name: "index_accounts_on_email"
    t.index ["hostname"], name: "index_accounts_on_hostname", unique: true
    t.index ["paused_plan_id"], name: "index_accounts_on_paused_plan_id"
    t.index ["plan_id"], name: "index_accounts_on_plan_id"
    t.index ["stripe_customer_id"], name: "index_accounts_on_stripe_customer_id", unique: true
    t.index ["stripe_subscription_id"], name: "index_accounts_on_stripe_subscription_id", unique: true
    t.index ["subdomain"], name: "index_accounts_on_subdomain", unique: true
  end

  create_table "app_events", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.integer "user_id"
    t.string "level", limit: 10, default: "info", null: false
    t.string "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["account_id"], name: "index_app_events_on_account_id"
    t.index ["user_id"], name: "index_app_events_on_user_id"
  end

  create_table "cancellation_categories", id: :serial, force: :cascade do |t|
    t.string "name", limit: 120, null: false
    t.boolean "active", default: true, null: false
    t.boolean "allow_message", default: false, null: false
    t.boolean "require_message", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], name: "index_cancellation_categories_on_name", unique: true
  end

  create_table "cancellation_reasons", id: :serial, force: :cascade do |t|
    t.integer "cancellation_category_id", null: false
    t.string "name", limit: 120, null: false
    t.boolean "active", default: true, null: false
    t.boolean "allow_message", default: true, null: false
    t.boolean "require_message", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cancellation_category_id", "name"], name: "index_cancellation_reasons_on_cancellation_category_id_and_name", unique: true
    t.index ["cancellation_category_id"], name: "index_cancellation_reasons_on_cancellation_category_id"
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "plans", id: :serial, force: :cascade do |t|
    t.string "stripe_id", limit: 80
    t.string "name", limit: 80, null: false
    t.string "statement_description", limit: 150
    t.boolean "active", default: true, null: false
    t.boolean "public", default: true, null: false
    t.integer "paused_plan_id"
    t.string "currency", limit: 3, default: "USD", null: false
    t.integer "interval_count", default: 1, null: false
    t.string "interval", limit: 5, default: "month", null: false
    t.integer "amount", default: 0, null: false
    t.integer "trial_period_days", default: 30, null: false
    t.integer "max_users", default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "allow_hostname", default: false, null: false
    t.boolean "allow_subdomain", default: false, null: false
    t.string "label", limit: 30
    t.boolean "allow_custom_path", default: false, null: false
    t.boolean "require_card_upfront", default: false, null: false
    t.index ["paused_plan_id"], name: "index_plans_on_paused_plan_id"
    t.index ["stripe_id"], name: "index_plans_on_stripe_id", unique: true
  end

  create_table "user_invitations", id: :serial, force: :cascade do |t|
    t.integer "account_id"
    t.string "first_name", limit: 60
    t.string "last_name", limit: 60
    t.string "email", limit: 60, null: false
    t.string "invite_code", limit: 36, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["account_id", "email"], name: "index_user_invitations_on_account_id_and_email", unique: true
    t.index ["account_id"], name: "index_user_invitations_on_account_id"
    t.index ["email"], name: "index_user_invitations_on_email"
    t.index ["invite_code"], name: "index_user_invitations_on_invite_code", unique: true
  end

  create_table "user_permissions", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "account_id", null: false
    t.boolean "account_admin", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "rec_num", null: false
    t.index ["account_id", "rec_num"], name: "index_user_permissions_on_account_id_and_rec_num", unique: true
    t.index ["account_id"], name: "index_user_permissions_on_account_id"
    t.index ["user_id", "account_id"], name: "index_user_permissions_on_user_id_and_account_id", unique: true
    t.index ["user_id"], name: "index_user_permissions_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 60
    t.string "last_name", limit: 60
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "super_admin", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "active", default: true, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
