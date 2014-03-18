CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIPALFT3I5VZQBGPA',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'us-east-1',                  # optional, defaults to 'us-east-1'
    :host                   => 'domiapp.co',             # optional, defaults to nil
    :endpoint               => 'https://domiapp.co' # optional, defaults to nil
  }
  config.fog_directory  = 'Domi'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end