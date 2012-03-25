module Cameraplus
  class User

    attr_reader :id, :username, :name, :avatar, :page_count, :photo_count, :pages

    def self.find(identifier, options = {})
      new Cameraplus::API::User.find(identifier, options)
    end

    def initialize(data)
      @data = data
      parse
    end

    def more_results
      @more_results ||= User.find(username, continue: next_page_id) if has_more_pages?
    end

    private

    def parse
      parse_user
      parse_pages if has_pages?
    end

    def parse_user
      @id          = @data.user.userid.to_i
      @username    = @data.user.username
      @name        = @data.user.realname
      @avatar      = @data.user.avatar
      @page_count  = parsed_page_count
      @photo_count = parsed_photo_count
    end

    def parse_pages
      @pages ||= @data.pages.map { |page| Page.new page }
    end

    def parsed_page_count
      @data.user.pages.to_i if has_page_count?
    end

    def parsed_photo_count
      @data.user.pictures.to_i if has_photo_count?
    end

    def next_page_id
      @data.next.match(next_page_regex).to_a.last
    end

    def next_page_regex
      /http:\/\/camerapl.us\/user\/#{username}:pages\?continue=(.*)/
    end

    def has_pages?
      @data.has_key? "pages"
    end

    def has_more_pages?
      @data.has_key? "next"
    end

    def has_page_count?
      @data.user.has_key? "pages"
    end

    def has_photo_count?
      @data.user.has_key? "pictures"
    end

  end
end
