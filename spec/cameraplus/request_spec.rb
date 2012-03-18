require "spec_helper"

describe Cameraplus::Request do

  subject { Cameraplus::Request }

  context "configuration" do

    it "should know it's base URI" do
      subject.base_uri.should eq "http://camerapl.us"
    end

    it "should know it's response format" do
      subject.format.should eq :json
    end

  end

  context "connecting with the api" do

    use_vcr_cassette :request_api

    let(:response) { subject.call("/user/mostlylisa:pages") }

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

end
