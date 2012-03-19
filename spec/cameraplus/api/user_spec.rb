require "spec_helper"

describe Cameraplus::API::User do

  use_vcr_cassette :user

  it "should be a hash" do
    response = Cameraplus::API::User.find "mostlylisa"
    response.should be_a Hash
  end

  it "should make a request to the Camera+ API" do
    Cameraplus::API::Request.should_receive(:call).with "/user/mostlylisa:pages", {}
    Cameraplus::API::User.find "mostlylisa"
  end

end
