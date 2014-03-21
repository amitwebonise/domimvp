class AddRequesterToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :requester_id, :integer
    remove_column :appointments, :tenant_id
    remove_column :appointments, :subletter_id
  end
end
