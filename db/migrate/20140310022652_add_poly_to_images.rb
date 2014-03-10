class AddPolyToImages < ActiveRecord::Migration
  def change
    remove_column :images, :attachable_id
    change_table :images do |t| 
      t.references :attachable, polymorphic: true
    end 
  end
end
