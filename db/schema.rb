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

ActiveRecord::Schema.define(version: 20200111141305) do

  create_table "communes", force: :cascade do |t|
    t.string   "name"
    t.string   "code_insee"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "intercommunality_id"
    t.integer  "street_id"
    t.index ["id"], name: "index_communes_on_id"
    t.index ["intercommunality_id"], name: "index_communes_on_intercommunality_id"
  end

  create_table "communes_streets", id: false, force: :cascade do |t|
    t.integer "commune_id", null: false
    t.integer "street_id",  null: false
  end

  create_table "intercommunalities", force: :cascade do |t|
    t.string   "name"
    t.integer  "siren"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "intercommunality_id"
    t.string   "form"
    t.index ["id"], name: "index_intercommunalities_on_id"
    t.index ["intercommunality_id"], name: "index_intercommunalities_on_intercommunality_id"
    t.index ["siren"], name: "index_intercommunalities_on_siren", unique: true
  end

  create_table "streets", force: :cascade do |t|
    t.string   "title"
    t.integer  "from"
    t.integer  "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "commune_id"
  end

end
