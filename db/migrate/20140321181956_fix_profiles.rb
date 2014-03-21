class FixProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :max_price
    add_column :profiles, :max_price, :integer
    
  end
end
