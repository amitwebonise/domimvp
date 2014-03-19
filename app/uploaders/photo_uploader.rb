class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWaveDirect::Uploader

  process :resize_to_fit => [300, 225]

  version :thumb do
    process :resize_to_fill => [300,225]
  end

  # version :thumb do
  #   process :resize_to_limit => [200, 200]
  # end

  storage :fog
end