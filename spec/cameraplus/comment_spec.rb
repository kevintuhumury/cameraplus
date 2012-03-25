require "spec_helper"

describe Cameraplus::Comment do

  let(:data) do
    {
      author: "Lisa Bettany",
      avatar: "https:\/\/fbcdn-profile-a.akamaihd.net\/hprofile-ak-snc4\/261022_674215636_4030749_q.jpg",
      url:    "http:\/\/www.facebook.com\/profile.php?id=674215636",
      text:   "great shot!"
    }
  end

  subject { Cameraplus::Comment.new data }

  it "has an author" do
    subject.author.should eq "Lisa Bettany"
  end

  it "has an avatar" do
    subject.avatar.should eq "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-snc4/261022_674215636_4030749_q.jpg"
  end

  it "has an url" do
    subject.url.should eq "http://www.facebook.com/profile.php?id=674215636"
  end

  it "has text" do
    subject.text.should eq "great shot!"
  end

end
