class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :iser_id, null: false

      t.timestamps
    end
  end
end
