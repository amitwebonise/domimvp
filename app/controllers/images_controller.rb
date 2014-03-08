class ImagesController < ApplicationController

  before_action :get_property

  def show
    @property = Property.find(params[:property_id])
    @image = @property.images
  end

  def create
    @property = Property.find(params[:property_id])
    @image = Image.new(image_params)

    respond_to do |format|
      if @image.save
        format.html { redirect_to @room, notice: 'Image was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @image }
      else
        format.html { render action: 'new' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
  def get_property
    @property = Property.where(id: params[:property_id]).first
  end

  def image_params
    params.require(:image).permit(:file, :property_id, :room_id)
  end

end
