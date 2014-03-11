class AddListingIdToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :listing_id, :integer
  end
end
