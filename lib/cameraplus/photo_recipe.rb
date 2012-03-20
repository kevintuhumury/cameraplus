module Cameraplus
  class PhotoRecipe

    attr_reader :type, :value

    def initialize(data)
      @type  = data.type
      @value = data.value
    end

  end
end
