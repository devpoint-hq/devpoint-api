class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.integer :years_of_experience, null: false
      t.integer :number_of_projects, null: false
      t.integer :self_rating, null: false
      t.integer :user_id
      t.timestamps
    end
    add_index :skills, [:user_id, :name], unique: true
  end
end
