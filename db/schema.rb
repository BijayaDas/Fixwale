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

ActiveRecord::Schema.define(version: 20170526053821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "pincode"
    t.integer  "address_type", limit: 2, default: 0
    t.bigint   "mobile"
    t.bigint   "telephone"
    t.integer  "user_id"
    t.integer  "provider_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["provider_id"], name: "index_addresses_on_provider_id", using: :btree
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "avg",           null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["rateable_type", "rateable_id"], name: "index_average_caches_on_rateable_type_and_rateable_id", using: :btree
    t.index ["rater_id"], name: "index_average_caches_on_rater_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "parent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "avatar"
  end

  create_table "enquiries", force: :cascade do |t|
    t.string   "title"
    t.string   "budget"
    t.text     "job_description"
    t.string   "mobile"
    t.string   "email"
    t.string   "deadline"
    t.text     "contact_details"
    t.string   "max_applications"
    t.integer  "status",           limit: 2, default: 0
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.datetime "deleted_at"
    t.index ["category_id"], name: "index_enquiries_on_category_id", using: :btree
    t.index ["deleted_at"], name: "index_enquiries_on_deleted_at", using: :btree
    t.index ["user_id"], name: "index_enquiries_on_user_id", using: :btree
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "description"
    t.integer  "provider_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["provider_id"], name: "index_feedbacks_on_provider_id", using: :btree
    t.index ["user_id"], name: "index_feedbacks_on_user_id", using: :btree
  end

  create_table "insta_bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "description"
    t.string   "date"
    t.string   "time"
    t.integer  "hours"
    t.integer  "payment_due"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "mobile"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "office_appointments", force: :cascade do |t|
    t.string   "description"
    t.string   "date"
    t.string   "time"
    t.integer  "hours"
    t.integer  "payment_due"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "overall_averages", force: :cascade do |t|
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "overall_avg",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["rateable_type", "rateable_id"], name: "index_overall_averages_on_rateable_type_and_rateable_id", using: :btree
  end

  create_table "pre_varified_resources", force: :cascade do |t|
    t.integer  "expert_level"
    t.string   "skill_sets"
    t.string   "years_experience"
    t.string   "designation"
    t.integer  "budget"
    t.string   "need_before"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "premium_employment_services", force: :cascade do |t|
    t.integer  "attempts_limit"
    t.integer  "current_attempt"
    t.boolean  "placed"
    t.string   "placed_in"
    t.integer  "paid_ammount"
    t.integer  "offered_ctc"
    t.boolean  "active"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "price_type",  limit: 2, default: 0
    t.integer  "provider_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["provider_id"], name: "index_prices_on_provider_id", using: :btree
  end

  create_table "providers", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "notice_period"
    t.string   "work_time_preference"
    t.string   "work_day_preference"
    t.string   "attached_resume"
    t.string   "portfolio_website"
    t.string   "linkedin_url"
    t.integer  "actively_looking",     limit: 2
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.datetime "deleted_at"
    t.index ["category_id"], name: "index_providers_on_category_id", using: :btree
    t.index ["deleted_at"], name: "index_providers_on_deleted_at", using: :btree
    t.index ["user_id"], name: "index_providers_on_user_id", using: :btree
  end

  create_table "providers_skills", id: false, force: :cascade do |t|
    t.integer "provider_id",                       null: false
    t.integer "skill_id"
    t.decimal "experience",          precision: 2
    t.integer "service_provider_id"
    t.index ["service_provider_id"], name: "index_providers_skills_on_service_provider_id", using: :btree
    t.index ["skill_id"], name: "index_providers_skills_on_skill_id", using: :btree
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["rateable_type", "rateable_id"], name: "index_rates_on_rateable_type_and_rateable_id", using: :btree
    t.index ["rater_id"], name: "index_rates_on_rater_id", using: :btree
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string   "cacheable_type"
    t.integer  "cacheable_id"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree
    t.index ["cacheable_type", "cacheable_id"], name: "index_rating_caches_on_cacheable_type_and_cacheable_id", using: :btree
  end

  create_table "replies", force: :cascade do |t|
    t.string   "expected_amount"
    t.integer  "status",          limit: 2
    t.text     "cover_letter"
    t.integer  "enquiry_id"
    t.integer  "provider_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["enquiry_id"], name: "index_replies_on_enquiry_id", using: :btree
    t.index ["provider_id"], name: "index_replies_on_provider_id", using: :btree
  end

  create_table "rs_evaluations", force: :cascade do |t|
    t.string   "reputation_name"
    t.string   "source_type"
    t.integer  "source_id"
    t.string   "target_type"
    t.integer  "target_id"
    t.float    "value",           default: 0.0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "data"
    t.index ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true, using: :btree
    t.index ["reputation_name"], name: "index_rs_evaluations_on_reputation_name", using: :btree
    t.index ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type", using: :btree
    t.index ["source_type", "source_id"], name: "index_rs_evaluations_on_source_type_and_source_id", using: :btree
    t.index ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type", using: :btree
    t.index ["target_type", "target_id"], name: "index_rs_evaluations_on_target_type_and_target_id", using: :btree
  end

  create_table "rs_reputation_messages", force: :cascade do |t|
    t.string   "sender_type"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.float    "weight",      default: 1.0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true, using: :btree
    t.index ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id", using: :btree
    t.index ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type", using: :btree
    t.index ["sender_type", "sender_id"], name: "index_rs_reputation_messages_on_sender_type_and_sender_id", using: :btree
  end

  create_table "rs_reputations", force: :cascade do |t|
    t.string   "reputation_name"
    t.float    "value",           default: 0.0
    t.string   "aggregated_by"
    t.string   "target_type"
    t.integer  "target_id"
    t.boolean  "active",          default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "data"
    t.index ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true, using: :btree
    t.index ["reputation_name"], name: "index_rs_reputations_on_reputation_name", using: :btree
    t.index ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type", using: :btree
    t.index ["target_type", "target_id"], name: "index_rs_reputations_on_target_type_and_target_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string "title"
    t.text   "description"
    t.string "hash_tag"
    t.string "avatar"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                       default: "",    null: false
    t.string   "last_name",                        default: "",    null: false
    t.string   "email",                            default: "",    null: false
    t.string   "encrypted_password",               default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "role",                   limit: 2, default: 0
    t.bigint   "mobile",                           default: 0
    t.boolean  "admin",                            default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
