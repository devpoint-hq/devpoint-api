class CreateEmployments < ActiveRecord::Migration[6.0]
  def change
    create_table :employments do |t|

      t.timestamps
    end
  end
end
