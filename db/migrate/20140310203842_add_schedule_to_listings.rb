class AddScheduleToListings < ActiveRecord::Migration
  def change
    add_column :listings, :schedule, :string
  end
end
