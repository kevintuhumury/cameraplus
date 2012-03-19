require 'spec_helper'

describe Cameraplus::Page do

  let(:data) do
    {
      url:           "http:\/\/campl.us\/iao4",
      tweettext:     "Carnival in Venice, a travel photographer''s dream shoot!",
      tweetid:       "180064216093437954",
      timestamp:     "2012-03-14 22:53:49",
      views:         1951,
      comments:      1,
      location:      "45.43383498680353 12.34226474539595",
      locationname:  "Venice, Venice",
      images:        [ photo ]
    }
  end

  let(:photo) do
    {
      "800px"     => "http:\/\/pics.campl.us\/f\/0\/0b497f01791c851db1a17f81e0621a5c.jpg",
      "120px"     => "http:\/\/pics.campl.us\/t\/0\/0b497f01791c851db1a17f81e0621a5c.jpg",
      "480px"     => "http:\/\/pics.campl.us\/iphone\/0\/0b497f01791c851db1a17f81e0621a5c.jpg",
      :fullwidth  => 800,
      :fullheight => 590,
      :location   => "45.43383498680353 12.34226474539595"
    }
  end

  subject { Cameraplus::Page.new data }

  context "instance" do

    it "has an url" do
      subject.url.should eq "http://campl.us/iao4"
    end

    it "has a created at datetime" do
      subject.created_at.should eq DateTime.parse("2012-03-14 22:53:49")
    end

    it "has a location" do
      subject.location.should eq "45.43383498680353 12.34226474539595"
    end

    it "has a location name" do
      subject.location_name.should eq "Venice, Venice"
    end

    it "has a tweet text" do
      subject.tweet_text.should eq "Carnival in Venice, a travel photographer''s dream shoot!"
    end

    it "has a tweet id" do
      subject.tweet_id.should eq 180064216093437954
    end

    it "has a view count" do
      subject.view_count.should eq 1951
    end

    it "has a comment count" do
      subject.comment_count.should eq 1
    end

  end

  context "#photos" do

    it "should be an Array" do
      subject.photos.should be_an Array
    end

    it "should contain a Cameraplus::Photo" do
      subject.photos.first.should be_a Cameraplus::Photo
    end

    it "should have one photo" do
      subject.photos.size.should eq 1
    end

  end

end
