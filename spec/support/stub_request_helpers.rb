module SpecHelpers
  module StubRequestHelpers
    def stub_api(method, path, opts = {})
      url = URI.join(NS1::Client::BASE_URL, path)
      response = opts[:response] || JSON.dump({})
      status = opts[:status] || 200

      stub_request(method, url).to_return(body: response, status: status)
    end
  end
end
