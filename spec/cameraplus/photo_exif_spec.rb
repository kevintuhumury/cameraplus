require "spec_helper"

describe Cameraplus::PhotoExif do

  let(:data) do
    { :title => "Exposure", :value => "1\/120 sec", :style => "main" }
  end

  subject { Cameraplus::PhotoExif.new data }

  it "should have a title" do
    subject.title.should eq "Exposure"
  end

  it "should have a value" do
    subject.value.should eq "1/120 sec"
  end

  it "should have a style" do
    subject.style.should eq "main"
  end

end
