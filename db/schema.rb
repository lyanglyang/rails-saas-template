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

ActiveRecord::Schema.define(version: 20141208093353) do

  create_table "accounts", force: true do |t|
    t.string   "company_name",                                        null: false
    t.string   "email",                                               null: false
    t.integer  "plan_id",                                             null: false
    t.integer  "paused_plan_id"
    t.boolean  "active",                               default: true, null: false
    t.string   "custom_path",              limit: 60
    t.string   "hostname"
    t.string   "subdomain",                limit: 64
    t.string   "address_line1",            limit: 120
    t.string   "address_line2",            limit: 120
    t.string   "address_city",             limit: 120
    t.string   "address_zip",              limit: 20
    t.string   "address_state",            limit: 60
    t.string   "address_country",          limit: 2
    t.string   "card_token",               limit: 60
    t.string   "card_brand",               limit: 25
    t.string   "card_last4",               limit: 4
    t.string   "card_exp",                 limit: 7
    t.string   "stripe_customer_id",       limit: 60
    t.string   "stripe_subscription_id",   limit: 60
    t.integer  "cancellation_category_id"
    t.integer  "cancellation_reason_id"
    t.string   "cancellation_message"
    t.datetime "cancelled_at"
    t.datetime "expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["cancellation_category_id"], name: "index_accounts_on_cancellation_category_id", using: :btree
  add_index "accounts", ["cancellation_reason_id"], name: "index_accounts_on_cancellation_reason_id", using: :btree
  add_index "accounts", ["custom_path"], name: "index_accounts_on_custom_path", unique: true, using: :btree
  add_index "accounts", ["email"], name: "index_accounts_on_email", using: :btree
  add_index "accounts", ["hostname"], name: "index_accounts_on_hostname", unique: true, using: :btree
  add_index "accounts", ["paused_plan_id"], name: "index_accounts_on_paused_plan_id", using: :btree
  add_index "accounts", ["plan_id"], name: "index_accounts_on_plan_id", using: :btree
  add_index "accounts", ["stripe_customer_id"], name: "index_accounts_on_stripe_customer_id", unique: true, using: :btree
  add_index "accounts", ["stripe_subscription_id"], name: "index_accounts_on_stripe_subscription_id", unique: true, using: :btree
  add_index "accounts", ["subdomain"], name: "index_accounts_on_subdomain", unique: true, using: :btree

  create_table "app_events", force: true do |t|
    t.integer  "account_id"
    t.integer  "user_id"
    t.string   "level",      limit: 10, default: "info", null: false
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "app_events", ["account_id"], name: "index_app_events_on_account_id", using: :btree
  add_index "app_events", ["user_id"], name: "index_app_events_on_user_id", using: :btree

  create_table "cancellation_categories", force: true do |t|
    t.string   "name",            limit: 120,                 null: false
    t.boolean  "active",                      default: true,  null: false
    t.boolean  "allow_message",               default: false, null: false
    t.boolean  "require_message",             default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cancellation_categories", ["name"], name: "index_cancellation_categories_on_name", unique: true, using: :btree

  create_table "cancellation_reasons", force: true do |t|
    t.integer  "cancellation_category_id",                             null: false
    t.string   "name",                     limit: 120,                 null: false
    t.boolean  "active",                               default: true,  null: false
    t.boolean  "allow_message",                        default: true,  null: false
    t.boolean  "require_message",                      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cancellation_reasons", ["cancellation_category_id", "name"], name: "index_cancellation_reasons_on_cancellation_category_id_and_name", unique: true, using: :btree
  add_index "cancellation_reasons", ["cancellation_category_id"], name: "index_cancellation_reasons_on_cancellation_category_id", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "plans", force: true do |t|
    t.string   "stripe_id",             limit: 80
    t.string   "name",                  limit: 80,                    null: false
    t.string   "statement_description", limit: 150
    t.boolean  "active",                            default: true,    null: false
    t.boolean  "public",                            default: true,    null: false
    t.integer  "paused_plan_id"
    t.string   "label",                 limit: 30
    t.string   "currency",              limit: 3,   default: "USD",   null: false
    t.integer  "interval_count",                    default: 1,       null: false
    t.string   "interval",              limit: 5,   default: "month", null: false
    t.integer  "amount",                            default: 0,       null: false
    t.integer  "trial_period_days",                 default: 30,      null: false
    t.boolean  "require_card_upfront",              default: false,   null: false
    t.integer  "max_users",                         default: 1,       null: false
    t.boolean  "allow_custom_path",                 default: false,   null: false
    t.boolean  "allow_hostname",                    default: false,   null: false
    t.boolean  "allow_subdomain",                   default: false,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plans", ["paused_plan_id"], name: "index_plans_on_paused_plan_id", using: :btree
  add_index "plans", ["stripe_id"], name: "index_plans_on_stripe_id", unique: true, using: :btree

  create_table "user_invitations", force: true do |t|
    t.integer  "account_id"
    t.string   "first_name",  limit: 60
    t.string   "last_name",   limit: 60
    t.string   "email",       limit: 60, null: false
    t.string   "invite_code", limit: 36, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_invitations", ["account_id", "email"], name: "index_user_invitations_on_account_id_and_email", unique: true, using: :btree
  add_index "user_invitations", ["account_id"], name: "index_user_invitations_on_account_id", using: :btree
  add_index "user_invitations", ["email"], name: "index_user_invitations_on_email", using: :btree
  add_index "user_invitations", ["invite_code"], name: "index_user_invitations_on_invite_code", unique: true, using: :btree

  create_table "user_permissions", force: true do |t|
    t.integer  "rec_num",                       null: false
    t.integer  "user_id",                       null: false
    t.integer  "account_id",                    null: false
    t.boolean  "account_admin", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_permissions", ["account_id", "rec_num"], name: "index_user_permissions_on_account_id_and_rec_num", unique: true, using: :btree
  add_index "user_permissions", ["account_id"], name: "index_user_permissions_on_account_id", using: :btree
  add_index "user_permissions", ["user_id", "account_id"], name: "index_user_permissions_on_user_id_and_account_id", unique: true, using: :btree
  add_index "user_permissions", ["user_id"], name: "index_user_permissions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name",             limit: 60
    t.string   "last_name",              limit: 60
    t.string   "email",                             default: "",    null: false
    t.boolean  "active",                            default: true,  null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                   default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "super_admin",                       default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
