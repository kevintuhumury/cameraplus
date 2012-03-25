module Cameraplus
  class Search

    attr_reader :page, :user, :photos

    def self.find(filters)
      results = Cameraplus::API::Search.find filters
      results.map { |result| new result }
    end

    def initialize(result)
      @result ||= result
      parse
    end

    private

    def parse
      parse_page
      parse_user if has_user?
      parse_photos if has_photos?
    end

    def parse_page
      @page ||= Page.new @result
    end

    def parse_user
      @user ||= User.new @result
    end

    def parse_photos
      @photos ||= @result.images.map { |photo| Photo.new photo }
    end

    def has_user?
      @result.has_key? "user"
    end

    def has_photos?
      @result.has_key? "images"
    end

  end
end
