module Cameraplus
  module API
    class Page

      def self.find(identifier, options = {})
        Request.call(uri(identifier), options)
      end

      private

      def self.uri(identifier)
        "/#{identifier}:info"
      end

    end
  end
end
