CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'compromise', #ENV['AWS_ID'],
    :aws_secret_access_key  => 'compromise',#ENV['AWS_KEY'],
    :region                 => 'ap-southeast-1'
  }
  config.fog_directory  = 'fixwale-web-contents'
  # config.asset_host     = 'http://localhost:3000'
  # config.fog_public     = true
  # config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
end
