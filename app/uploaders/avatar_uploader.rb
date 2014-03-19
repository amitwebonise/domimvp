class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWaveDirect::Uploader

  process :resize_to_fit => [400, 400]

  version :thumb do
    process :resize_to_fill => [200,200]
  end

  version :show do
    process :resize_to_fill => [400,400]
  end

  # version :thumb do
  #   process :resize_to_limit => [200, 200]
  # end
end