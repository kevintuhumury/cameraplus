require "coveralls"
Coveralls.wear!

require "cameraplus"
require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.ignore_localhost     = true
  c.cassette_library_dir = "spec/vcr_cassettes"

  c.ignore_request do |request|
    request.uri =~ /coveralls\.io/
  end
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
end
