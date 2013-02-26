module Cameraplus
  module API
    class Page < Base

      private

      def self.uri(identifier)
        "/#{identifier}:info"
      end

    end
  end
end
