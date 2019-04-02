class CreateTransitions < ActiveRecord::Migration[5.2]
  def change
    create_table :transitions do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :block_no
      t.integer :e_no
      t.integer :turn
      t.datetime :acted_at
      t.integer :act
      t.integer :data_type
      t.float :value

      t.timestamps
    end
  end
end
