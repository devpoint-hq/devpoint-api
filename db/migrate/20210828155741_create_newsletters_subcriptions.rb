class CreateNewslettersSubcriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :newsletters_subcriptions do |t|
      t.boolean :monday_morning_newsletter, default: true
      t.boolean :featured_developer_newsletter, default: true
      t.integer :user_id
      
      t.timestamps
    end
  end
end
