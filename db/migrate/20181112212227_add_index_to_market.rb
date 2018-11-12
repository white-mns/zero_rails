class AddIndexToMarket < ActiveRecord::Migration[5.2]
  def change
    add_index :markets, [:e_no, :market_no, :result_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :markets, :name
    add_index :markets, :kind_id
    add_index :markets, :unique_1
    add_index :markets, :unique_2
    add_index :markets, :value
    add_index :markets, :invation
    add_index :markets, :encount
    add_index :markets, :technic
    add_index :markets, :goodwill
    add_index :markets, :intelligence
    add_index :markets, :stock
    add_index :markets, :add_effect_id
    add_index :markets, :strength
    add_index :markets, :equip
    add_index :markets, :fuka_1_id
    add_index :markets, :fuka_2_id
    add_index :markets, :charge
    add_index :markets, :orig_name_id
  end
end
