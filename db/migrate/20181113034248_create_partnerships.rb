class CreatePartnerships < ActiveRecord::Migration[5.2]
  def change
    create_table :partnerships do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :partner_e_no

      t.timestamps
    end
  end
end
