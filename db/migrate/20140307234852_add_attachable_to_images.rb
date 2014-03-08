class AddAttachableToImages < ActiveRecord::Migration
  def change
    add_reference :images, :attachable, index: true
  end
end
