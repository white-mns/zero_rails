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

ActiveRecord::Schema.define(version: 2018_11_12_233509) do

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "i_no"
    t.string "name"
    t.integer "kind_id"
    t.integer "unique_1"
    t.integer "unique_2"
    t.integer "value"
    t.integer "invation"
    t.integer "encount"
    t.integer "technic"
    t.integer "goodwill"
    t.integer "intelligence"
    t.integer "stock"
    t.integer "add_effect_id"
    t.integer "strength"
    t.integer "equip"
    t.integer "fuka_1_id"
    t.integer "fuka_2_id"
    t.integer "orig_name_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["add_effect_id"], name: "index_items_on_add_effect_id"
    t.index ["e_no", "i_no", "result_no", "generate_no"], name: "unique_eno"
    t.index ["encount"], name: "index_items_on_encount"
    t.index ["equip"], name: "index_items_on_equip"
    t.index ["fuka_1_id"], name: "index_items_on_fuka_1_id"
    t.index ["fuka_2_id"], name: "index_items_on_fuka_2_id"
    t.index ["goodwill"], name: "index_items_on_goodwill"
    t.index ["intelligence"], name: "index_items_on_intelligence"
    t.index ["invation"], name: "index_items_on_invation"
    t.index ["kind_id"], name: "index_items_on_kind_id"
    t.index ["name"], name: "index_items_on_name"
    t.index ["orig_name_id"], name: "index_items_on_orig_name_id"
    t.index ["stock"], name: "index_items_on_stock"
    t.index ["strength"], name: "index_items_on_strength"
    t.index ["technic"], name: "index_items_on_technic"
    t.index ["unique_1"], name: "index_items_on_unique_1"
    t.index ["unique_2"], name: "index_items_on_unique_2"
    t.index ["value"], name: "index_items_on_value"
  end

  create_table "markets", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "market_no"
    t.string "name"
    t.integer "kind_id"
    t.integer "unique_1"
    t.integer "unique_2"
    t.integer "value"
    t.integer "invation"
    t.integer "encount"
    t.integer "technic"
    t.integer "goodwill"
    t.integer "intelligence"
    t.integer "stock"
    t.integer "add_effect_id"
    t.integer "strength"
    t.integer "equip"
    t.integer "fuka_1_id"
    t.integer "fuka_2_id"
    t.integer "charge"
    t.integer "orig_name_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["add_effect_id"], name: "index_markets_on_add_effect_id"
    t.index ["charge"], name: "index_markets_on_charge"
    t.index ["e_no", "market_no", "result_no", "generate_no"], name: "unique_eno"
    t.index ["encount"], name: "index_markets_on_encount"
    t.index ["equip"], name: "index_markets_on_equip"
    t.index ["fuka_1_id"], name: "index_markets_on_fuka_1_id"
    t.index ["fuka_2_id"], name: "index_markets_on_fuka_2_id"
    t.index ["goodwill"], name: "index_markets_on_goodwill"
    t.index ["intelligence"], name: "index_markets_on_intelligence"
    t.index ["invation"], name: "index_markets_on_invation"
    t.index ["kind_id"], name: "index_markets_on_kind_id"
    t.index ["name"], name: "index_markets_on_name"
    t.index ["orig_name_id"], name: "index_markets_on_orig_name_id"
    t.index ["stock"], name: "index_markets_on_stock"
    t.index ["strength"], name: "index_markets_on_strength"
    t.index ["technic"], name: "index_markets_on_technic"
    t.index ["unique_1"], name: "index_markets_on_unique_1"
    t.index ["unique_2"], name: "index_markets_on_unique_2"
    t.index ["value"], name: "index_markets_on_value"
  end

  create_table "names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.string "name"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "unique_eno"
    t.index ["name"], name: "index_names_on_name"
    t.index ["nickname"], name: "index_names_on_nickname"
  end

  create_table "proper_names", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "proper_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_proper_names_on_name"
    t.index ["proper_id"], name: "index_proper_names_on_proper_id"
  end

  create_table "regalia", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "regalia_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "unique_eno"
    t.index ["regalia_id"], name: "index_regalia_on_regalia_id"
  end

  create_table "specs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "invation"
    t.integer "encount"
    t.integer "technic"
    t.integer "goodwill"
    t.integer "intelligence"
    t.integer "drink"
    t.integer "illegality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drink"], name: "index_specs_on_drink"
    t.index ["e_no", "result_no", "generate_no"], name: "unique_eno"
    t.index ["encount"], name: "index_specs_on_encount"
    t.index ["goodwill"], name: "index_specs_on_goodwill"
    t.index ["illegality"], name: "index_specs_on_illegality"
    t.index ["intelligence"], name: "index_specs_on_intelligence"
    t.index ["invation"], name: "index_specs_on_invation"
    t.index ["technic"], name: "index_specs_on_technic"
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "ranking_rate"
    t.integer "rp"
    t.float "acc_total"
    t.float "acc_attack"
    t.float "acc_support"
    t.float "acc_defense"
    t.integer "funds"
    t.integer "exp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acc_attack"], name: "index_statuses_on_acc_attack"
    t.index ["acc_defense"], name: "index_statuses_on_acc_defense"
    t.index ["acc_support"], name: "index_statuses_on_acc_support"
    t.index ["acc_total"], name: "index_statuses_on_acc_total"
    t.index ["e_no", "result_no", "generate_no"], name: "unique_eno"
    t.index ["exp"], name: "index_statuses_on_exp"
    t.index ["funds"], name: "index_statuses_on_funds"
    t.index ["ranking_rate"], name: "index_statuses_on_ranking_rate"
    t.index ["rp"], name: "index_statuses_on_rp"
  end

end
