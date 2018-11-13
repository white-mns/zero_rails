class AddIndexToRegalia < ActiveRecord::Migration[5.2]
  def change
    add_index :regalia, [:e_no, :result_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :regalia, :regalia_id
  end
end
