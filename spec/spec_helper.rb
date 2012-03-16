if ENV["coverage"]
  require "simplecov"
  SimpleCov.start
end

require "cameraplus"
require "vcr_config"

RSpec.configure do |c|
  c.extend VCR::RSpec::Macros
end
