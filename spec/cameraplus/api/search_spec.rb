require "spec_helper"

describe Cameraplus::API::Search do

  context "with a valid argument" do

    use_vcr_cassette :search

    it "should receive an Array" do
      response = Cameraplus::API::Search.find username: "mostlylisa"
      response.should be_a Array
    end

    it "should make a request to the Camera+ API" do
      Cameraplus::API::Request.should_receive(:call).with "/search", { username: "mostlylisa" }
      Cameraplus::API::Search.find username: "mostlylisa"
    end

  end

  context "with an invalid argument" do

    it "when searching for an non-existing argument should raise an error" do
      expect { Cameraplus::API::Search.find foo: "bar" }.to raise_error Cameraplus::InvalidArgumentError
    end

  end

  context "with no arguments" do

    it "should raise an argument error" do
      expect { Cameraplus::API::Search.find() }.to raise_error ArgumentError
    end

  end

end
