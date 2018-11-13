class AddIndexToBlock < ActiveRecord::Migration[5.2]
  def change
    add_index :blocks, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :blocks, :block_no
  end
end
