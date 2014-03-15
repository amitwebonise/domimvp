class AddDetailsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :zip_code, :integer
    add_column :properties, :city, :string
    add_column :properties, :state, :string
  end
end
