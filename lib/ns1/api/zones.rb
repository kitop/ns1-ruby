# frozen_string_literal: true

module NS1
  module API
    module Zones
      def zones
        perform_request(HTTP_GET, "/v1/zones")
      end

      def zone(zone)
        raise NS1::MissingParameter, "zone cannot be blank" if blank?(zone)
        perform_request(HTTP_GET, "/v1/zones/#{zone}")
      end

      def create_zone(zone, params = {})
        raise NS1::MissingParameter, "zone cannot be blank" if blank?(zone)
        params = params.merge(zone: zone)
        perform_request(HTTP_PUT, "/v1/zones/#{zone}", params)
      end

      def modify_zone(zone, params)
        raise NS1::MissingParameter, "zone cannot be blank" if blank?(zone)
        perform_request(HTTP_POST, "/v1/zones/#{zone}", params)
      end

      def delete_zone(zone)
        raise NS1::MissingParameter, "zone cannot be blank" if blank?(zone)
        perform_request(HTTP_DELETE, "/v1/zones/#{zone}")
      end
    end
  end
end
