require "spec_helper"

describe Cameraplus::User do

  use_vcr_cassette :user

  let(:user) { Cameraplus::User.find "mostlylisa" }

  it "should be a User" do
    user.should be_a Cameraplus::User
  end

  context ".find" do

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
      user.page_count.should eq 122
    end

    it "finds the number of photos of the specified user" do
      user.photo_count.should eq 876
    end

  end

  context "#pages" do

    it "should be an Array" do
      user.pages.should be_a Array
    end

    it "should contain a Cameraplus::Page" do
      user.pages.first.should be_a Cameraplus::Page
    end

    it "should have one page" do
      user.pages.size.should eq 3
    end

  end

  context "#more_results" do

    use_vcr_cassette :more_results

    let(:user)          { Cameraplus::User.find "kalleboo" }
    let(:more_results)  { user.more_results }

    it "should be a User" do
      more_results.should be_a Cameraplus::User
    end

    it "should retrieve more pages" do
      more_results.pages.should be_an Array
    end

    it "should contain pages that aren't the same as the first pages" do
      more_results.pages.should_not eq user.pages
    end

    it "should contain Cameraplus::Page objects" do
      more_results.pages.each { |page| page.should be_a Cameraplus::Page }
    end

  end

end
