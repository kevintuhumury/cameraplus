module Cameraplus
  module API
    class Search

      def self.find(filters)
        if has_valid_filters filters
          Request.call "/search", filters
        else
          raise InvalidArgumentError
        end
      end

      private

      def self.valid_filters
        %w(username tweettext earliest latest locationname)
      end

      def self.has_valid_filters(filters)
        filters.keys.select { |filter| valid_filters.include?(filter.to_s) }.any?
      end

    end
  end
end
