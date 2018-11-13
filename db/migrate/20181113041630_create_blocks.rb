class CreateBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :blocks do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :block_no
      t.integer :e_no

      t.timestamps
    end
  end
end
