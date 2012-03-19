module Cameraplus
  class Photo

    attr_reader :small, :medium, :large, :width, :height, :location

    def initialize(data)
      @small    = data["120px"]
      @medium   = data["480px"]
      @large    = data["800px"]
      @width    = data.fullwidth.to_i
      @height   = data.fullheight.to_i
      @location = data.location
    end

  end
end
