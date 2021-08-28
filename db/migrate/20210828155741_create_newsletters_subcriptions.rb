class CreateNewslettersSubcriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :newsletters_subcriptions do |t|

      t.timestamps
    end
  end
end
