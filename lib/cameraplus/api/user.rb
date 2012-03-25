module Cameraplus
  module API
    class User

      def self.find(identifier, options = {})
        Request.call uri(identifier), options
      end

      private

      def self.uri(identifier)
        "/user/#{identifier}:pages"
      end

    end
  end
end
