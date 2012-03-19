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

    private

    def parse
      parse_user
      parse_pages
    end

    def parse_user
      @id          = @data.user.userid.to_i
      @username    = @data.user.username
      @name        = @data.user.realname
      @avatar      = @data.user.avatar
      @page_count  = @data.user.pages.to_i
      @photo_count = @data.user.pictures.to_i
    end

    def parse_pages
      @pages ||= @data.pages.map { |page| Page.new(page) }
    end

  end
end
