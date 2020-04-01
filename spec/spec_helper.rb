# frozen_string_literal: true

require_relative './support/vcr/config'

RSpec.configure do |config|
  config.order = :random
  config.color = :on
  config.filter_run_excluding quarantine: true
end
