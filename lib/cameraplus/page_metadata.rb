module Cameraplus
  class PageMetadata

    attr_reader :url, :created_at, :location, :location_name, :tweet_text, :tweet_id, :view_count, :comment_count, :user, :photos, :comments

    def self.find(identifier, options = {})
      new Cameraplus::API::Page.find(identifier, options), identifier
    end

    def initialize(data, identifier)
      @data       = data
      @identifier = identifier
      parse
    end

    private

    def parse
      parse_metadata
      parse_user
      parse_photos
      parse_comments
    end

    def parse_metadata
      @url           = parsed_url
      @created_at    = parsed_created_at
      @location      = parsed_location
      @location_name = parsed_location_name
      @tweet_text    = @data.page.tweet.text
      @tweet_id      = @data.page.tweet.id.to_i
      @view_count    = @data.page.views
      @comment_count = @data.page.comments.to_i
    end

    def parse_user
      @user ||= Cameraplus::User.new user: @data.page.tweet
    end

    def parse_photos
      @photos ||= @data.pictures.map { |photo| Photo.new photo }
    end

    def parse_comments
      @comments ||= @data.comments.map { |comment| Comment.new comment }
    end

    def parsed_url
      "#{Cameraplus::API::Request.base_uri}/#{@identifier}"
    end

    def parsed_created_at
      DateTime.parse @data.page.timestamp if has_timestamp?
    end

    def parsed_location
      @data.page.location.coords if has_location?
    end

    def parsed_location_name
      @data.page.location.name if has_location?
    end

    def has_timestamp?
      @data.page.has_key? "timestamp"
    end

    def has_location?
      @data.page.has_key? "location"
    end

  end
end
