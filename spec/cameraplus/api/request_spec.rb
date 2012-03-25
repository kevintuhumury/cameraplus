require "spec_helper"

describe Cameraplus::API::Request do

  subject { Cameraplus::API::Request }

  context "configuration" do

    it "should know it's base URI" do
      subject.base_uri.should eq "http://camerapl.us"
    end

  end

  context "connecting with the api" do

    use_vcr_cassette :api_request_valid

    let(:response) { subject.call "/user/mostlylisa:pages" }

    it "should have a response" do
      response.should_not be_nil
    end

    it "should contain user data" do
      response.should have_key "user"
    end

    it "should contain user pages" do
      response.should have_key "pages"
    end

  end

  context "connecting with an invalid api call" do

    use_vcr_cassette :api_request_invalid

    let(:response) { subject.call "/non-existing-page" }

    it "should raise an error" do
      expect { response }.to raise_error Cameraplus::InvalidResponseError
    end

  end

end
