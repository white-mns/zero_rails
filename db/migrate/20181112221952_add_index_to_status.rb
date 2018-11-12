class AddIndexToStatus < ActiveRecord::Migration[5.2]
  def change
    add_index :statuses, [:e_no, :result_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :statuses, :ranking_rate
    add_index :statuses, :rp
    add_index :statuses, :acc_total
    add_index :statuses, :acc_attack
    add_index :statuses, :acc_support
    add_index :statuses, :acc_defense
    add_index :statuses, :funds
    add_index :statuses, :exp
  end
end
