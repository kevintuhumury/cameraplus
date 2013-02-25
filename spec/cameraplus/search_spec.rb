require "spec_helper"

describe Cameraplus::Search do

  context "by username", :vcr do

    let(:results) { Cameraplus::Search.find username: "mostlylisa" }

    it "should find a list of results" do
      results.should be_an Array
    end

    context "with a Search object selected" do

      let(:result) { results.first }

      context "#page" do

        it "should be a Page" do
          result.page.should be_a Cameraplus::Page
        end

      end

      context "#user" do

        it "should be a User" do
          result.user.should be_a Cameraplus::User
        end

      end

      context "#photos" do

        it "should be an Array" do
          result.photos.should be_an Array
        end

        it "should contain a Cameraplus::Photo" do
          result.photos.first.should be_a Cameraplus::Photo
        end

      end

    end

  end

end
