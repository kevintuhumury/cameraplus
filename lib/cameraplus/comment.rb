module Cameraplus
  class Comment

    attr_reader :author, :avatar, :url, :text

    def initialize(data)
      @author = data.author
      @avatar = data.avatar
      @url    = data.url
      @text   = data.text
    end

  end
end
