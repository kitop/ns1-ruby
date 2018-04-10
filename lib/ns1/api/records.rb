# frozen_string_literal: true

module NS1
  module API
    module Records
      def record(zone, domain, type)
        raise NS1::MissingParameter, "zone cannot be blank" if blank?(zone)
        raise NS1::MissingParameter, "domain cannot be blank" if blank?(domain)
        raise NS1::MissingParameter, "type cannot be blank" if blank?(type)
        perform_request(HTTP_GET, "/v1/zones/#{zone}/#{domain}/#{type}")
      end

      def create_record(zone, domain, type, params = {})
        raise NS1::MissingParameter, "zone cannot be blank" if blank?(zone)
        raise NS1::MissingParameter, "domain cannot be blank" if blank?(domain)
        raise NS1::MissingParameter, "type cannot be blank" if blank?(type)
        validate_required!(params, :answers)
        params = params.merge(zone: zone, domain: domain, type: type)
        perform_request(HTTP_PUT, "/v1/zones/#{zone}/#{domain}/#{type}", params)
      end

      def modify_record(zone, domain, type, params)
        raise NS1::MissingParameter, "zone cannot be blank" if blank?(zone)
        raise NS1::MissingParameter, "domain cannot be blank" if blank?(domain)
        raise NS1::MissingParameter, "type cannot be blank" if blank?(type)
        perform_request(HTTP_POST, "/v1/zones/#{zone}/#{domain}/#{type}", params)
      end

      def delete_record(zone, domain, type)
        raise NS1::MissingParameter, "zone cannot be blank" if blank?(zone)
        raise NS1::MissingParameter, "domain cannot be blank" if blank?(domain)
        raise NS1::MissingParameter, "type cannot be blank" if blank?(type)
        perform_request(HTTP_DELETE, "/v1/zones/#{zone}/#{domain}/#{type}")
      end
    end
  end
end
