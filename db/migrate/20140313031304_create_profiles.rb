class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :year
      t.string :major
      t.text :activities_and_clubs
      t.boolean :looking_for_place
      t.boolean :open_to_roommates
      t.decimal :price_range
      t.references :user, index: true

      t.timestamps
    end
  end
end
