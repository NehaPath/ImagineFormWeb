require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module ImagineFormWeb
  class Application < Rails::Application

    AWS::S3::Base.establish_connection!{
    :access_key_id     => ENV['AWS_ACCESS_KEY_ID']
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }

    BUCKET = ENV['imagineformweb']

     config.active_record.raise_in_transactional_callbacks = true
     config.assets.initialize_on_precompile = false

  end
end
