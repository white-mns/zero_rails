class AddIndexToSpec < ActiveRecord::Migration[5.2]
  def change
    add_index :specs, [:e_no, :result_no, :generate_no], :unique => false, :name => 'unique_eno'
    add_index :specs, :invation
    add_index :specs, :encount
    add_index :specs, :technic
    add_index :specs, :goodwill
    add_index :specs, :intelligence
    add_index :specs, :drink
    add_index :specs, :illegality
  end
end
