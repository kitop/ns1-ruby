# frozen_string_literal: true

module NS1
  module API
    module Account

      #
      # Returns the basic contact details associated with your account
      #
      # @return [NS1::Response]
      #
      def account()
        perform_request(HTTP_GET, "/v1/account/settings")
      end

      #
      # Returns toggles and thresholds used when sending overage warning
      #
      # @return [NS1::Response]
      #
      def account_overage()
        perform_request(HTTP_GET, "/v1/account/usagewarnings")
      end

    end
  end
end
