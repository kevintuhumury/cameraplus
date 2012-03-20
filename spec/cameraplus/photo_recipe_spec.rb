require "spec_helper"

describe Cameraplus::PhotoRecipe do

  let(:data) do
    { :type => "fx", :value => "Vibrant" }
  end

  subject { Cameraplus::PhotoRecipe.new data }

  it "should have a type" do
    subject.type.should eq "fx"
  end

  it "should have a value" do
    subject.value.should eq "Vibrant"
  end

end
