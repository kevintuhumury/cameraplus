require "spec_helper"

describe Cameraplus::User do

  use_vcr_cassette :user

  let(:user) { Cameraplus::User.find "mostlylisa" }

  it "finds the id of the specified user" do
    user.id.should eq 6978642
  end

  it "finds the username of the specified user" do
    user.username.should eq "mostlylisa"
  end

  it "finds the name of the specified user" do
    user.name.should eq "Lisa Bettany"
  end

  it "finds the avatar of the specified user" do
    user.avatar.should eq "http://a0.twimg.com/profile_images/1767370289/284161_10150711631895637_674215636_19658534_6246798_n_normal.jpeg"
  end

  it "finds the number of pages of the specified user" do
    user.page_count.should eq 120
  end

  it "finds the number of photos of the specified user" do
    user.photo_count.should eq 874
  end

end
