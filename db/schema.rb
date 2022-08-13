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

ActiveRecord::Schema.define(version: 2022_08_13_133724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.bigint "category_id"
    t.string "cluster"
    t.string "nama_entitas"
    t.string "satuan_kerja"
    t.string "lokasi_kerja"
    t.string "nama_pic"
    t.string "jabatan_pic"
    t.string "emaiil_pic"
    t.string "keterangan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "work_unit_id"
    t.string "kontak_pic"
    t.bigint "user_id"
    t.string "email_user"
    t.index ["category_id"], name: "index_contacts_on_category_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
    t.index ["work_unit_id"], name: "index_contacts_on_work_unit_id"
  end

  create_table "data_companies", force: :cascade do |t|
    t.bigint "category_id"
    t.string "cluster"
    t.string "nama_entitas"
    t.string "area"
    t.string "lokasi_kerja"
    t.string "alamat"
    t.string "website"
    t.string "daftar_pekerjaan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email_user"
    t.string "keterangan"
    t.index ["category_id"], name: "index_data_companies_on_category_id"
  end

  create_table "project_potentials", force: :cascade do |t|
    t.string "nama_entitas"
    t.string "cluster"
    t.string "lokasi"
    t.string "judul_tender"
    t.string "nilai"
    t.integer "nominal"
    t.string "lini_bisnis"
    t.date "jadwal_perkiraan_tender"
    t.integer "durasi_proyek"
    t.string "remark"
    t.string "konfirmasi"
    t.string "informasi_tambahan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "realization_visit_plans", force: :cascade do |t|
    t.string "nama_entitas_lokasi_pengadaan"
    t.string "subjek_deksripsi_pekerjaan"
    t.string "cluster"
    t.string "realisasi"
    t.date "realisasi_tgl_peretemuan"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sales_id"
    t.string "email_user"
    t.bigint "sales_visit_plan_id"
    t.index ["category_id"], name: "index_realization_visit_plans_on_category_id"
    t.index ["sales_visit_plan_id"], name: "index_realization_visit_plans_on_sales_visit_plan_id"
  end

  create_table "role_assignments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_assignments_on_role_id"
    t.index ["user_id"], name: "index_role_assignments_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", null: false
    t.text "permissions"
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_visit_plans", force: :cascade do |t|
    t.string "nama_entitas_lokasi_pengadaan"
    t.string "jenis_pekerjaan"
    t.string "deksripsi_pekerjaan"
    t.string "cluster"
    t.date "estimasi_tgl_peretemuan"
    t.string "nama"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email_user"
    t.string "minggu_kunjungan"
    t.string "minggu1"
    t.string "minggu2"
    t.string "minggu3"
    t.string "minggu4"
    t.index ["category_id"], name: "index_sales_visit_plans_on_category_id"
  end

  create_table "status_reports", force: :cascade do |t|
    t.string "catatan"
    t.string "hasil_kunjungan"
    t.date "tgl_aktivitas"
    t.bigint "realization_visit_plan_id"
    t.string "status_laporan"
    t.date "tgl_direview"
    t.index ["realization_visit_plan_id"], name: "index_status_reports_on_realization_visit_plan_id"
  end

  create_table "type_workers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "username"
    t.boolean "state", default: true
    t.string "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_units", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "contacts", "categories"
  add_foreign_key "contacts", "users"
  add_foreign_key "contacts", "work_units"
  add_foreign_key "data_companies", "categories"
  add_foreign_key "realization_visit_plans", "categories"
  add_foreign_key "realization_visit_plans", "sales_visit_plans"
  add_foreign_key "role_assignments", "roles"
  add_foreign_key "role_assignments", "users"
  add_foreign_key "sales_visit_plans", "categories"
  add_foreign_key "status_reports", "realization_visit_plans"
end
