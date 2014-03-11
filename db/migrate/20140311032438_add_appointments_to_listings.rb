class AddAppointmentsToListings < ActiveRecord::Migration
  def change
    add_reference :listings, :appointment, index: true
  end
end
