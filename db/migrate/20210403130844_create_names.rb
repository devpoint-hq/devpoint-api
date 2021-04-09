class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :other_names
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :names, [:user_id, :first_name], unique: true
    add_index :names, [:user_id, :last_name], unique: true
    add_index :names, [:user_id, :other_names], unique: true
  end
end
