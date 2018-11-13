class CreateIntentions < ActiveRecord::Migration[5.2]
  def change
    create_table :intentions do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :intention_id

      t.timestamps
    end
  end
end
