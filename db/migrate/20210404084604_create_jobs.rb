class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title, null: false
      t.string :company_name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :user_id
      
      t.timestamps
    end
  end
end
