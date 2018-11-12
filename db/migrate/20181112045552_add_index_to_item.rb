class AddIndexToItem < ActiveRecord::Migration[5.2]
  def change
    add_index :items, [:e_no, :i_no, :result_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :items, :name
    add_index :items, :kind_id
    add_index :items, :unique_1
    add_index :items, :unique_2
    add_index :items, :value
    add_index :items, :invation
    add_index :items, :encount
    add_index :items, :technic
    add_index :items, :goodwill
    add_index :items, :intelligence
    add_index :items, :stock
    add_index :items, :add_effect_id
    add_index :items, :strength
    add_index :items, :equip
    add_index :items, :fuka_1_id
    add_index :items, :fuka_2_id
    add_index :items, :orig_name_id
  end
end
