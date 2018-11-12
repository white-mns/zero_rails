class CreateRegalia < ActiveRecord::Migration[5.2]
  def change
    create_table :regalia do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :regalia_id

      t.timestamps
    end
  end
end
