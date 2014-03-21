class AddDetailsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :max_price, :string
    remove_column :profiles, :price_range
  end
end
