class ImagesController < ApplicationController

  before_action :get_property
  
  private
  
  def get_property
    @property = Property.where(id: params[:property_id]).first
  end
  
  public

  def create
    params[:files].each do |file|
      i = Image.new(property_id: @property.id)
      i.photo = file
      i.photo = File.open('somewhere')
      i.save!
    end
    
    flash[:notice] = "Successfully uploaded Images"
    redirect_to properties_path
  end

end