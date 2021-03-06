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

ActiveRecord::Schema.define(version: 2018_11_13_082036) do

  create_table "assembly_nums", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "division_type_id"
    t.integer "proper_name_id"
    t.integer "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["division_type_id"], name: "index_assembly_nums_on_division_type_id"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno"
    t.index ["num"], name: "index_assembly_nums_on_num"
    t.index ["proper_name_id"], name: "index_assembly_nums_on_proper_name_id"
  end

  create_table "blocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "block_no"
    t.integer "e_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_no"], name: "index_blocks_on_block_no"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno"
  end

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "condition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition_id"], name: "index_conditions_on_condition_id"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno"
  end

  create_table "intentions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "intention_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno"
    t.index ["intention_id"], name: "index_intentions_on_intention_id"
  end

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

  create_table "next_battles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "block_no"
    t.integer "e_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_no"], name: "index_next_battles_on_block_no"
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno"
  end

  create_table "partnerships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "partner_e_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno"
    t.index ["partner_e_no"], name: "index_partnerships_on_partner_e_no"
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

  create_table "rewards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "e_no"
    t.integer "reward_type_id"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["e_no", "result_no", "generate_no"], name: "resultno_eno"
    t.index ["reward_type_id"], name: "index_rewards_on_reward_type_id"
    t.index ["value"], name: "index_rewards_on_value"
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

  create_table "transitions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "result_no"
    t.integer "generate_no"
    t.integer "block_no"
    t.integer "e_no"
    t.integer "turn"
    t.datetime "acted_at"
    t.integer "act"
    t.integer "data_type"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_type"], name: "index_transitions_on_data_type"
    t.index ["e_no", "act", "acted_at", "block_no", "result_no", "generate_no"], name: "eno_act_actedat"
    t.index ["e_no", "act", "turn", "block_no", "result_no", "generate_no"], name: "eno_act_turn"
    t.index ["value"], name: "index_transitions_on_value"
  end

end
