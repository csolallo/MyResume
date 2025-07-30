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

ActiveRecord::Schema[8.0].define(version: 2016_09_08_192729) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "accomplishments", id: :serial, force: :cascade do |t|
    t.text "description", null: false
    t.string "associated_type"
    t.integer "associated_id"
    t.index ["associated_id", "associated_type"], name: "index_accomplishments_on_associated_id_and_associated_type"
    t.index ["associated_type", "associated_id"], name: "index_accomplishments_on_associated_type_and_associated_id"
  end

  create_table "apps", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "platform", limit: 50, null: false
    t.string "url", limit: 100, null: false
    t.integer "project_id", null: false
    t.text "comment"
    t.string "image_url"
    t.index ["project_id"], name: "index_apps_on_project_id"
  end

  create_table "certificates", id: :serial, force: :cascade do |t|
    t.string "origin", limit: 100, null: false
    t.string "title", limit: 100, null: false
    t.float "gpa"
    t.integer "year"
    t.integer "person_id"
    t.index ["person_id"], name: "index_certificates_on_person_id"
  end

  create_table "companies", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "address1"
    t.string "address2"
    t.string "city", limit: 50
    t.string "state", limit: 2
    t.string "zip", limit: 10
  end

  create_table "people", id: :serial, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "uuid", null: false
    t.string "address1"
    t.string "address2"
    t.string "city", limit: 50
    t.string "state", limit: 2
    t.string "zip", limit: 10
    t.string "email", limit: 80
    t.string "number", limit: 20
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "role_id", null: false
    t.index ["role_id"], name: "index_projects_on_role_id"
  end

  create_table "projects_tags", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "tag_id", null: false
    t.index ["project_id", "tag_id"], name: "index_projects_tags_on_project_id_and_tag_id"
  end

  create_table "resumes", id: :serial, force: :cascade do |t|
    t.integer "person_id", null: false
    t.index ["person_id"], name: "index_resumes_on_person_id"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "title", null: false
    t.datetime "start_date", precision: nil, null: false
    t.datetime "end_date", precision: nil
    t.integer "resume_id"
    t.integer "company_id", null: false
    t.index ["company_id"], name: "index_roles_on_company_id"
    t.index ["resume_id"], name: "index_roles_on_resume_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end
end
