class AddIndexToPartnership < ActiveRecord::Migration[5.2]
  def change
    add_index :partnerships, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :partnerships, :partner_e_no
  end
end
