CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAIPALFT3I5VZQBGPA',       # required
    :aws_secret_access_key  => '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',       # required
    # :region                 => 'us-west-2'  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'Domi' # required
  # see https://github.com/jnicklas/carrierwave#using-amazon-s3
  # for more optional configuration
end