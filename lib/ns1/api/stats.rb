# frozen_string_literal: true

module NS1
  module API
    module Stats

      #
      # Returns current queries per second (QPS) for the account
      #
      # @return [NS1::Response]
      #
      def qps()
        perform_request(HTTP_GET, "/v1/stats/qps")
      end

      #
      # Returns current queries per second (QPS) for a specific zone
      #
      # @param [<Type>] zone <description>
      #
      # @return [NS1::Response]
      #
      def zone_qps(zone)
        raise NS1::MissingParameter, "zone cannot be blank" if blank?(zone)
        normalize_names!(zone)
        perform_request(HTTP_GET, "/v1/stats/qps/#{zone}")
      end

      #
      # Returns current queries per second (QPS) for a specific record
      #
      # @param [String] zone zone name
      # @param [String] domain record name
      # @param [String] type record type (A, CNAME etc)
      #
      # @return [NS1::Response]
      #
      def record_qps(zone, domain, type)
        raise NS1::MissingParameter, "zone cannot be blank" if blank?(zone)
        raise NS1::MissingParameter, "domain cannot be blank" if blank?(domain)
        raise NS1::MissingParameter, "type cannot be blank" if blank?(type)
        normalize_names!(zone, domain)
        perform_request(HTTP_GET, "/v1/stats/qps/#{zone}/#{domain}/#{type}")
      end

      #
      # Returns statistics and graphs for the entire account over a given period
      #
      # @param [Hash] params will be used as the request body
      #
      # @option params [String] :period one of `1h`, `24h`, or `30d`
      #
      #   Default: 24h
      #
      # @option params [Boolean] :expand if `true` breaks down stats by zone.
      #
      #   Default: `false`
      #
      # @option params [Boolean] :aggregate if `true` returns aggregated stats across all zones and billing tiers
      #
      #   Default: `false`
      #
      # @return [NS1::Response]
      #
      def usage(params = {})
        perform_request(HTTP_GET, "/v1/stats/usage", params)
      end

      #
      # Returns statistics and graphs for a given zone over a given period
      #
      # @param [Hash] params will be used as the request body
      # @param [String] zone NS1 zone name
      #
      # @option params [String] :period one of `1h`, `24h`, or `30d`
      #
      #   Default: 24h
      #
      # @option params [Boolean] :expand if `true` breaks down stats by zone.
      #
      #   Default: `false`
      #
      # @option params [Boolean] :aggregate if `true` returns aggregated stats across all zones and billing tiers
      #
      #   Default: `false`
      #
      # @return [NS1::Response]
      #
      def zone_usage(zone, params = {})
        raise NS1::MissingParameter, "zone cannot be blank" if blank?(zone)
        normalize_names!(zone)
        perform_request(HTTP_GET, "/v1/stats/usage/#{zone}", params)
      end

      #
      # Returns statistics and graphs for a given record over a given period
      #
      # @param [Hash] params will be used as the request body
      # @param [String] zone zone name
      # @param [String] domain record name
      # @param [String] type record type (A, CNAME etc)
      #
      # @option params [String] :period one of `1h`, `24h`, or `30d`
      #
      #   Default: 24h
      #
      # @option params [Boolean] :expand if `true` breaks down stats by zone.
      #
      #   Default: `false`
      #
      # @option params [Boolean] :aggregate if `true` returns aggregated stats across all zones and billing tiers
      #
      #   Default: `false`
      #
      # @return [NS1::Response]
      #
      def record_usage(zone, domain, type, params = {})
        raise NS1::MissingParameter, "zone cannot be blank" if blank?(zone)
        raise NS1::MissingParameter, "domain cannot be blank" if blank?(domain)
        raise NS1::MissingParameter, "type cannot be blank" if blank?(type)
        normalize_names!(zone, domain)
        perform_request(HTTP_GET, "/v1/stats/usage/#{zone}/#{domain}/#{type}", params)
      end

    end
  end
end
