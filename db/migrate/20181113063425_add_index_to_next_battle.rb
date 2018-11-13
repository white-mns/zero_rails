class AddIndexToNextBattle < ActiveRecord::Migration[5.2]
  def change
    add_index :next_battles, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :next_battles, :block_no
  end
end
