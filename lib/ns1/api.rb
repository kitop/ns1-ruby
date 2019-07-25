# frozen_string_literal: true

Dir[ File.expand_path('../api/*.rb', __FILE__) ].each { |f| require f }

module NS1
  module API
    HTTP_GET    = "GET"
    HTTP_POST   = "POST"
    HTTP_PUT    = "PUT"
    HTTP_DELETE = "DELETE"

    def self.included(base)
      base.send :include,
        NS1::API::Zones,
        NS1::API::Records,
        NS1::API::Account,
        NS1::API::Stats,
        NS1::API::Jobs
    end

  end
end
