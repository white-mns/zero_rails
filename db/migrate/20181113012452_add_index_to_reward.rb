class AddIndexToReward < ActiveRecord::Migration[5.2]
  def change
    add_index :rewards, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :rewards, :reward_type_id
    add_index :rewards, :value
  end
end
