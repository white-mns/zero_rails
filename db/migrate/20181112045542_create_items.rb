class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :i_no
      t.string :name
      t.integer :kind_id
      t.integer :unique_1
      t.integer :unique_2
      t.integer :value
      t.integer :invation
      t.integer :encount
      t.integer :technic
      t.integer :goodwill
      t.integer :intelligence
      t.integer :stock
      t.integer :add_effect_id
      t.integer :strength
      t.integer :equip
      t.integer :fuka_1_id
      t.integer :fuka_2_id
      t.integer :orig_name_id

      t.timestamps
    end
  end
end
