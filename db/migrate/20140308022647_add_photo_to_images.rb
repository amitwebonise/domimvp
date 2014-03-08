class AddPhotoToImages < ActiveRecord::Migration
  def change
    add_column :images, :file, :string
  end
end
