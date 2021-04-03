class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :other_names
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
