class AddPropertyIdToListings < ActiveRecord::Migration
  def change
    add_reference :listings, :property, index: true
  end
end
