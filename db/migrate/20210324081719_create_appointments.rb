class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :time, null: false
      t.string :location
      t.string :online_link, null: false
      t.boolean :confirmed, default: false
      t.integer :appointment_host_id
      t.integer :appointment_guest_id

      t.timestamps
    end
  end
end
