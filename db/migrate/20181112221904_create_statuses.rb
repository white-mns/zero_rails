class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :ranking_rate
      t.integer :rp
      t.float :acc_total
      t.float :acc_attack
      t.float :acc_support
      t.float :acc_defense
      t.integer :funds
      t.integer :exp

      t.timestamps
    end
  end
end
