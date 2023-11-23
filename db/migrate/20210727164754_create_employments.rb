class CreateEmployments < ActiveRecord::Migration[6.0]
  def change
    create_table :employments do |t|
      t.string :title, null: false, default: ""
      t.string :company_name, null: false, default: ""
      t.string :description, null: false, default: ""
      t.datetime :start_date, null: false, default: ""
      t.datetime :end_date, null: false, default: ""
      t.integer :user_id

      t.timestamps
    end
  end
end
