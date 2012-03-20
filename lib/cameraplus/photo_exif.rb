module Cameraplus
  class PhotoExif

    attr_reader :title, :value, :style

    def initialize(data)
      @title = data.title
      @value = data.value
      @style = data.style
    end

  end
end
