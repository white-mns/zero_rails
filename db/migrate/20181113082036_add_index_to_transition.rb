class AddIndexToTransition < ActiveRecord::Migration[5.2]
  def change
    add_index :transitions, [:e_no, :act, :turn, :block_no, :result_no, :generate_no], :unique => false, :name => 'eno_act_turn'
    add_index :transitions, [:e_no, :act, :acted_at, :block_no, :result_no, :generate_no], :unique => false, :name => 'eno_act_actedat'
    add_index :transitions, :data_type
    add_index :transitions, :value
  end
end
