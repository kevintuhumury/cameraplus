module Cameraplus
  class Page

    attr_reader :url, :created_at, :location, :location_name, :tweet_text, :tweet_id, :view_count, :comment_count, :photos

    def initialize(data)
      @data = data
      parse
    end

    private

    def parse
      parse_page
      parse_photos
    end

    def parse_page
      @url           = @data.url
      @created_at    = DateTime.parse @data.timestamp
      @location      = @data.location
      @location_name = @data.locationname
      @tweet_text    = @data.tweettext
      @tweet_id      = @data.tweetid.to_i
      @view_count    = @data.views
      @comment_count = @data.comments.to_i
    end

    def parse_photos
      @photos ||= @data.images.map { |image| Photo.new image }
    end

  end
end
