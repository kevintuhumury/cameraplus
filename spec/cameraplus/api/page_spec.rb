require "spec_helper"

describe Cameraplus::API::Page do

  use_vcr_cassette :page, :record => :new_episodes

  it "should receive a Hash" do
    response = Cameraplus::API::Page.find "b72Z"
    response.should be_a Hash
  end
  
  it "should parse page from 'Create a web link' API" do
    response = Cameraplus::API::Page.find "gcD72vPLXoq"
    response.should be_a Hash
  end

end
