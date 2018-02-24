require 'carrierwave/orm/activerecord'
CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV["AMAZON_KEY"],
      aws_secret_access_key: ENV["AMAZON_SECRET_KEY"],
      region: 'eu-west-2'
  }

  case Rails.env
    when 'production'
      config.fog_directory = 'pigeonyelp'
      config.asset_host = 'https://s3-eu-west-2.amazonaws.com/pigeonyelp'

    when 'development'
      config.fog_directory = 'pigeonyelp'
      config.asset_host = 'https://s3-eu-west-2.amazonaws.com/pigeonyelp'

  end
end
