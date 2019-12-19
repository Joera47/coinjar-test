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

ActiveRecord::Schema.define(version: 20191219162523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bitcoins", force: :cascade do |t|
    t.float "ask"
    t.float "bid"
    t.float "last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ask"], name: "index_bitcoins_on_ask"
    t.index ["bid"], name: "index_bitcoins_on_bid"
    t.index ["last"], name: "index_bitcoins_on_last"
  end

  create_table "ethereums", force: :cascade do |t|
    t.float "ask"
    t.float "bid"
    t.float "last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ask"], name: "index_ethereums_on_ask"
    t.index ["bid"], name: "index_ethereums_on_bid"
    t.index ["last"], name: "index_ethereums_on_last"
  end

end
