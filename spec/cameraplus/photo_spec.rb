require 'spec_helper'

describe Cameraplus::Photo do

  let(:data) do
    {
      "800px"      => "http:\/\/pics.campl.us\/f\/0\/0b497f01791c851db1a17f81e0621a5c.jpg",
      "120px"      => "http:\/\/pics.campl.us\/t\/0\/0b497f01791c851db1a17f81e0621a5c.jpg",
      "480px"      => "http:\/\/pics.campl.us\/iphone\/0\/0b497f01791c851db1a17f81e0621a5c.jpg",
      "fullwidth"  => 800,
      "fullheight" => 590,
      "location"   => "45.43383498680353 12.34226474539595",
      "recipe"     => [
        {
          "type"   => "fx",
          "value"  => "Vibrant"
        }
      ],
      "exifdata"   => [
        {
          "title"  => "Camera",
          "value"  => "Apple iPhone 4S",
          "style"  => "main"
        }
      ]
    }
  end

  subject { Cameraplus::Photo.new data }

  context "instance" do

    it "has a small version" do
      subject.small.should eq "http://pics.campl.us/t/0/0b497f01791c851db1a17f81e0621a5c.jpg"
    end

    it "has a medium version" do
      subject.medium.should eq "http://pics.campl.us/iphone/0/0b497f01791c851db1a17f81e0621a5c.jpg"
    end

    it "has a large version" do
      subject.large.should eq "http://pics.campl.us/f/0/0b497f01791c851db1a17f81e0621a5c.jpg"
    end

    it "has a width" do
      subject.width.should eq 800
    end

    it "has a height" do
      subject.height.should eq 590
    end

    it "has a location" do
      subject.location.should eq "45.43383498680353 12.34226474539595"
    end

  end

  context "#recipes" do

    it "should have recipes" do
      subject.recipes.should be_an Array
    end

    it "should contain a Cameraplus::PhotoRecipe" do
      subject.recipes.first.should be_a Cameraplus::PhotoRecipe
    end

  end

  context "#exif" do

    it "should have exif data" do
      subject.exif.should be_an Array
    end

    it "should contain a Cameraplus::PhotoExif" do
      subject.exif.first.should be_a Cameraplus::PhotoExif
    end

  end
end
