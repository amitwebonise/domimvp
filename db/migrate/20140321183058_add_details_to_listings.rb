class AddDetailsToListings < ActiveRecord::Migration
  def change
    add_column :listings, :needed, :text
  end
end
