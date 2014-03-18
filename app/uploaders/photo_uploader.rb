class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :resize_to_fit => [300, 225]

  version :thumb do
    process :resize_to_fill => [300,225]
  end

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # version :thumb do
  #   process :resize_to_limit => [200, 200]
  # end
end