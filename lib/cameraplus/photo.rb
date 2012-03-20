module Cameraplus
  class Photo

    attr_reader :small, :medium, :large, :width, :height, :location, :recipes, :exif

    def initialize(data)
      @data = data
      parse
    end

    private

    def parse
      parse_photo
      parse_recipes if has_recipes?
      parse_exif if has_exif?
    end

    def parse_photo
      @small    = @data["120px"]
      @medium   = @data["480px"]
      @large    = @data["800px"]
      @width    = @data.fullwidth.to_i
      @height   = @data.fullheight.to_i
      @location = @data.location if has_location?
    end

    def parse_recipes
      @recipes ||= @data.recipe.map { |recipe| PhotoRecipe.new recipe }
    end

    def parse_exif
      @exif ||= @data.exifdata.map { |exif| PhotoExif.new exif }
    end

    def has_recipes?
      @data.has_key? "recipe"
    end

    def has_exif?
      @data.has_key? "exifdata"
    end

    def has_location?
      @data.has_key? "location"
    end

  end
end
