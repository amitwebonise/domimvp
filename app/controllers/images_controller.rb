class ImagesController < ApplicationController
  params[:files].each do |file|
    i = Image.new(property_id: @property.id)
    i.photo = file
    i.photo = File.open('somewhere')
    i.save!
  end
end