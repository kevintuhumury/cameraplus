require "spec_helper"

describe Cameraplus::API::Page do

  use_vcr_cassette :page

  it "should receive a Hash" do
    response = Cameraplus::API::Page.find "b72Z"
    response.should be_a Hash
  end

  it "should make a request to the Camera+ API" do
    Cameraplus::API::Request.should_receive(:call).with "/b72Z:info", {}
    Cameraplus::API::Page.find "b72Z"
  end

end
