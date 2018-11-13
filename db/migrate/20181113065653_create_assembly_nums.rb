class CreateAssemblyNums < ActiveRecord::Migration[5.2]
  def change
    create_table :assembly_nums do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :division_type_id
      t.integer :proper_name_id
      t.integer :num

      t.timestamps
    end
  end
end
