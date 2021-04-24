class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :links, [:user_id, :name], unique: true
    add_index :links, [:user_id, :url], unique: true
  end
end
