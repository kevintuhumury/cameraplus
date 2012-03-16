module Cameraplus
  class User

    attr_reader :id, :username, :name, :avatar, :page_count, :photo_count

    def initialize(data)
      @id          = data.user.userid.to_i
      @username    = data.user.username
      @name        = data.user.realname
      @avatar      = data.user.avatar
      @page_count  = data.user.pages.to_i
      @photo_count = data.user.pictures.to_i
    end

    def self.find(identifier, options = {})
      new Request.new("/user/#{identifier}:pages", options).response
    end

  end
end
