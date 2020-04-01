# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = File.expand_path "#{__dir__}/cassettes"
  config.hook_into :webmock
  config.ignore_localhost = true

  config.default_cassette_options = {
    serialize_with: :json
  }
end
