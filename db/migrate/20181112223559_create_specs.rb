class CreateSpecs < ActiveRecord::Migration[5.2]
  def change
    create_table :specs do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :invation
      t.integer :encount
      t.integer :technic
      t.integer :goodwill
      t.integer :intelligence
      t.integer :drink
      t.integer :illegality

      t.timestamps
    end
  end
end
