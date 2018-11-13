class AddIndexToCondition < ActiveRecord::Migration[5.2]
  def change
    add_index :conditions, [:e_no, :result_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :conditions, :condition_id
  end
end
