class AddIndexToIntention < ActiveRecord::Migration[5.2]
  def change
    add_index :intentions, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :intentions, :intention_id
  end
end
