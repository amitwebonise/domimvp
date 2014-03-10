class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :tenant, index: true
      t.references :subletter, index: true

      t.timestamps
    end
  end
end
