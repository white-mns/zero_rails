class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :condition_id

      t.timestamps
    end
  end
end
