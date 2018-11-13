class AddIndexToAssemblyNum < ActiveRecord::Migration[5.2]
  def change
    add_index :assembly_nums, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :assembly_nums, :division_type_id
    add_index :assembly_nums, :proper_name_id
    add_index :assembly_nums, :num
  end
end
