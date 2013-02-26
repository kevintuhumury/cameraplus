module Cameraplus
  module API
    class Base

      def self.find(identifier, options = {})
        Request.call uri(identifier), options
      end

    end
  end
end
