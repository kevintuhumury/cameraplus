module Cameraplus
  module API
    class Request
      include HTTParty

      base_uri "http://camerapl.us"

      def self.call(url, options = {})
        new(url, options).parsed_response
      end

      def initialize(url, options = {})
        @url      = url
        @options  = options
      end

      def parsed_response
        if code == 200
          @response.parsed_response
        else
          raise InvalidResponseError, message
        end
      end

      private

      def request
        @response ||= self.class.get @url, query: @options
      end

      def response
        request.response
      end

      def code
        response.code.to_i
      end

      def message
        "#{@response.message} (#{@response.code}): #{@response.body}\n#{@response.inspect}"
      end

    end
  end
end
