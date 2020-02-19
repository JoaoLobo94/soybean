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

ActiveRecord::Schema.define(version: 2020_02_18_163557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "soy_beans", force: :cascade do |t|
    t.string "class"
    t.string "classification"
    t.string "date"
    t.string "plant_stand"
    t.string "precip"
    t.string "temp"
    t.string "hail"
    t.string "crop_hist"
    t.string "area_damaged"
    t.string "severity"
    t.string "seed_tmt"
    t.string "germination"
    t.string "plant_growth"
    t.string "leaves"
    t.string "leafspots_halo"
    t.string "leafspots_marg"
    t.string "leafspot_size"
    t.string "leaf_shread"
    t.string "leaf_malf"
    t.string "leaf_mild"
    t.string "stem"
    t.string "lodging"
    t.string "stem_cankers"
    t.string "canker_lesion"
    t.string "fruiting_bodies"
    t.string "external_decay"
    t.string "mycelium"
    t.string "int_discolor"
    t.string "sclerotia"
    t.string "fruit_pods"
    t.string "fruit_spots"
    t.string "seed"
    t.string "mold_growth"
    t.string "seed_discolor"
    t.string "seed_size"
    t.string "shriveling"
    t.string "roots"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
