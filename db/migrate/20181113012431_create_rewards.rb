class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :reward_type_id
      t.float :value

      t.timestamps
    end
  end
end
