module Cameraplus
  class Page

    attr_reader :url, :timestamp, :location, :location_name, :tweet_text, :tweet_id, :view_count, :comment_count

    def initialize(data)
      @url           = data.url
      @timestamp     = data.timestamp
      @location      = data.location
      @location_name = data.locationname
      @tweet_text    = data.tweettext
      @tweet_id      = data.tweetid
      @view_count    = data.views.to_i
      @comment_count = data.comments.to_i
    end

  end
end
