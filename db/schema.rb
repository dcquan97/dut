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

ActiveRecord::Schema[7.0].define(version: 2023_08_02_134319) do
  create_table "active_storage_attachments", id: :bigint, default: -> { "unique_rowid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :bigint, default: -> { "unique_rowid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", id: :bigint, default: -> { "unique_rowid()" }, force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "car_rentals", id: :bigint, default: -> { "unique_rowid()" }, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.bigint "status", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumbnail"
  end

  create_table "ckeditor_assets", id: :bigint, default: -> { "unique_rowid()" }, force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.bigint "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "news", id: :bigint, default: -> { "unique_rowid()" }, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.bigint "status", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumbnail"
  end

  create_table "our_guests", id: :bigint, default: -> { "unique_rowid()" }, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.string "thumbnail"
    t.bigint "status", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "our_partners", id: :bigint, default: -> { "unique_rowid()" }, force: :cascade do |t|
    t.string "partner_image"
    t.bigint "status", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "our_teams", id: :bigint, default: -> { "unique_rowid()" }, force: :cascade do |t|
    t.string "name"
    t.text "title"
    t.string "team_image"
    t.bigint "status", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_infos", id: :bigint, default: -> { "unique_rowid()" }, force: :cascade do |t|
    t.string "about_home"
    t.text "about_us"
    t.string "image_about"
    t.string "link_fb"
    t.string "link_youtube"
    t.string "link_twitter"
    t.string "contact_us"
    t.string "sdt"
    t.string "email"
    t.string "address"
    t.bigint "status", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_contact"
  end

  create_table "tours", id: :bigint, default: -> { "unique_rowid()" }, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "category"
    t.string "price"
    t.bigint "status", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumbnail"
    t.string "mini_description"
    t.bigint "rating"
    t.bigint "highlight"
  end

  create_table "users", id: :bigint, default: -> { "unique_rowid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "name"
    t.string "avatar"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.bigint "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
