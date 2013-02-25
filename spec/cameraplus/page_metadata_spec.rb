require "spec_helper"

describe Cameraplus::PageMetadata, :vcr do

  subject { Cameraplus::PageMetadata.find "mnc5" }

  it "should be a Page" do
    subject.should be_a Cameraplus::PageMetadata
  end

  context ".find" do

    it "finds the url of the specified page" do
      subject.url.should eq "http://camerapl.us/mnc5"
    end

    it "finds the created at datetime of the specified page" do
      subject.created_at.should eq DateTime.parse("2012-10-14 19:02:41")
    end

    it "finds the location of the specified page" do
      subject.location.should eq "-54.83939283532541 -68.31303983001813"
    end

    it "finds the location name of the specified page" do
      subject.location_name.should eq "Ushuaia, Argentina"
    end

    it "finds the tweet text of the specified page" do
      subject.tweet_text.should eq "Ushuaia, Argentina. El fin del mundo!"
    end

    it "finds the tweet id of the specified page" do
      subject.tweet_id.should eq 257557053906763776
    end

    it "finds the view count of the specified page" do
      subject.view_count.should eq 6340
    end

    it "finds the comment count of the specified page" do
      subject.comment_count.should eq 5
    end

  end

  context "#user" do

    it "should be a User" do
      subject.user.should be_a Cameraplus::User
    end

    it "has an username" do
      subject.user.username.should eq "mostlylisa"
    end

    it "has a name" do
      subject.user.name.should eq "Lisa Bettany"
    end

  end

  context "#photos" do

    it "should be an Array" do
      subject.photos.should be_an Array
    end

    it "should contain a Cameraplus::Photo" do
      subject.photos.first.should be_a Cameraplus::Photo
    end

    context "with a Cameraplus::Photo" do

      it "should have recipes" do
        subject.photos.first.recipes.should be_an Array
      end

      it "should contain a Cameraplus::PhotoRecipe" do
        subject.photos.first.recipes.first.should be_a Cameraplus::PhotoRecipe
      end

      it "should have exif data" do
        subject.photos.last.exif.should be_an Array
      end

      it "should contain a Cameraplus::PhotoExif" do
        subject.photos.first.exif.first.should be_a Cameraplus::PhotoExif
      end

    end

  end

  context "#comments" do

    it "should be an Array" do
      subject.comments.should be_an Array
    end

    it "should contain a Cameraplus::Comment" do
      subject.comments.first.should be_a Cameraplus::Comment
    end

    it "should know the number of comments" do
      subject.comments.size.should eq 5
    end

    it "should know the authors of the comments" do
      subject.comments.map(&:author).should eq ["Robert-Paul Jansen", "Tiffy Huges", "francisco", "ionica", "bemap iphoneography"]
    end

    it "should be optional" do
      subject = Cameraplus::PageMetadata.find "gcD72vPLXoq"
      subject.comments.should be_an Array
      subject.comments.size.should eq 0
    end

  end

end
