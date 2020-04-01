# frozen_string_literal: true

require 'httpclient'
require 'contracts'
require 'json'

# Httpbin
module Httpbin
  # noinspection RubyNilAnalysis
  class Client
    include Contracts

    BASE_URL = URI.parse 'https://httpbin.org'
    private_constant :BASE_URL

    Contract None => Any

    def initialize
      @http_client = HTTPClient.new
      @http_client.base_url = BASE_URL
    end

    Contract None => Hash

    def slideshow
      response = @http_client.get 'json'
      raise StandardError, 'oops' if response.status == 500

      JSON.parse response.body,
                 symbolize_names: true
    end
  end
end
