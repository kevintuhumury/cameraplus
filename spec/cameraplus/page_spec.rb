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
      images:        []
    }
  end

  subject { Cameraplus::Page.new(data) }

  it "has an url" do
    subject.url.should eq "http://campl.us/iao4"
  end

  it "has a timestamp" do
    subject.timestamp.should eq "2012-03-14 22:53:49"
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
    subject.tweet_id.should eq "180064216093437954"
  end

  it "has a view count" do
    subject.view_count.should eq 1951
  end

  it "has a comment count" do
    subject.comment_count.should eq 1
  end

end
