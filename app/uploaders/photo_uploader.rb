class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :resize_to_fit => [500, 350]

  version :thumb do
    process :resize_to_fill => [300,225]
  end

  version :gallery do
    process :resize_to_fill => [500,350]
  end  

  # version :thumb do
  #   process :resize_to_limit => [200, 200]
  # end

  storage :fog
end