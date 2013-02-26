module Cameraplus
  module API
    class User < Base

      private

      def self.uri(identifier)
        "/user/#{identifier}:pages"
      end

    end
  end
end
