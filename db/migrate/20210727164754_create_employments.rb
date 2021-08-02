class CreateEmployments < ActiveRecord::Migration[6.0]
  def change
    create_table :employments do |t|
      t.string :title, null: false
      t.string :company_name
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
