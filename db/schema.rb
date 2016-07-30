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

ActiveRecord::Schema.define(version: 20160609155228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "pincode"
    t.integer  "address_type",        limit: 2, default: 0
    t.bigint   "mobile"
    t.bigint   "telephone"
    t.integer  "user_id"
    t.integer  "service_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["service_provider_id"], name: "index_addresses_on_service_provider_id", using: :btree
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "background_details", force: :cascade do |t|
    t.integer  "verification_status"
    t.text     "document_description"
    t.integer  "document_type"
    t.integer  "service_provider_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["address_id"], name: "index_background_details_on_address_id", using: :btree
    t.index ["service_provider_id"], name: "index_background_details_on_service_provider_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.text     "description"
    t.integer  "mobile"
    t.integer  "reporting_time"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "hours"
    t.boolean  "repeat"
    t.integer  "total_amount"
    t.integer  "status",              limit: 2, default: 0
    t.integer  "booking_type",        limit: 2, default: 0
    t.integer  "service_site",        limit: 2, default: 0
    t.integer  "user_id"
    t.integer  "address_id"
    t.integer  "service_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: :cascade do |t|
    t.text    "description"
    t.integer "mobile"
    t.integer "reporting_time"
    t.date    "start_date"
    t.date    "end_date"
    t.integer "hours"
    t.boolean "repeat"
    t.integer "total_amount"
    t.integer "status",              limit: 2, default: 0
    t.integer "booking_type",        limit: 2, default: 0
    t.integer "service_site",        limit: 2, default: 0
    t.integer "user_id"
    t.integer "address_id"
    t.integer "service_provider_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "service_provider_id"
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domains", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "icon"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_applications", force: :cascade do |t|
    t.string   "expected_amount"
    t.integer  "status",              limit: 2
    t.text     "cover_letter"
    t.integer  "job_id"
    t.integer  "service_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["job_id"], name: "index_job_applications_on_job_id", using: :btree
    t.index ["service_provider_id"], name: "index_job_applications_on_service_provider_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "headline"
    t.text     "job_description"
    t.text     "contact_details"
    t.integer  "max_applications"
    t.date     "expiration_date"
    t.integer  "domain_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["domain_id"], name: "index_jobs_on_domain_id", using: :btree
    t.index ["user_id"], name: "index_jobs_on_user_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.integer  "name"
    t.boolean  "read"
    t.boolean  "write"
    t.boolean  "speak"
    t.integer  "fluency_level",       limit: 2, default: 0
    t.integer  "service_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "parent_id"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "service_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["service_provider_id"], name: "index_messages_on_service_provider_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "overall_averages", force: :cascade do |t|
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "price_type",          limit: 2, default: 0
    t.integer  "service_provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["service_provider_id"], name: "index_prices_on_service_provider_id", using: :btree
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
    t.index ["rater_id"], name: "index_rates_on_rater_id", using: :btree
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string   "cacheable_type"
    t.integer  "cacheable_id"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
    t.index ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", using: :btree
  end

  create_table "rs_evaluations", force: :cascade do |t|
    t.string   "reputation_name"
    t.string   "source_type"
    t.integer  "source_id"
    t.string   "target_type"
    t.integer  "target_id"
    t.float    "value",           default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
    t.index ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true, using: :btree
    t.index ["reputation_name"], name: "index_rs_evaluations_on_reputation_name", using: :btree
    t.index ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type", using: :btree
    t.index ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type", using: :btree
  end

  create_table "rs_reputation_messages", force: :cascade do |t|
    t.string   "sender_type"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.float    "weight",      default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true, using: :btree
    t.index ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id", using: :btree
    t.index ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type", using: :btree
  end

  create_table "rs_reputations", force: :cascade do |t|
    t.string   "reputation_name"
    t.float    "value",           default: 0.0
    t.string   "aggregated_by"
    t.string   "target_type"
    t.integer  "target_id"
    t.boolean  "active",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
    t.index ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true, using: :btree
    t.index ["reputation_name"], name: "index_rs_reputations_on_reputation_name", using: :btree
    t.index ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type", using: :btree
  end

  create_table "service_providers", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "notice_period"
    t.string   "attached_resume"
    t.string   "portfolio_website"
    t.string   "linkedin_url"
    t.boolean  "actively_looking"
    t.integer  "domain_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_providers_skills", id: false, force: :cascade do |t|
    t.integer "service_provider_id"
    t.integer "skill_id"
    t.decimal "experience",          precision: 2
    t.index ["service_provider_id"], name: "index_service_providers_skills_on_service_provider_id", using: :btree
    t.index ["skill_id"], name: "index_service_providers_skills_on_skill_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.text   "description"
    t.string "icon"
    t.string "hash_tag"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                       default: "", null: false
    t.string   "last_name",                        default: "", null: false
    t.string   "email",                            default: "", null: false
    t.string   "encrypted_password",               default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.datetime "deleted_at"
    t.bigint   "mobile"
    t.integer  "role",                   limit: 2, default: 0
    t.index ["deleted_at"], name: "index_users_on_deleted_at", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "work_days", force: :cascade do |t|
    t.integer "day",        limit: 2, default: 0
    t.string  "start_time"
    t.string  "end_date"
  end

end
