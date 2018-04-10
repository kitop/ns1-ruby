module SpecHelpers
  module StubRequestHelpers
    def stub_api(method, path, opts = {})
      url = URI.join(NS1::Client::BASE_URL, path)
      response = JSON.dump(opts[:response] || {})

      stub_request(method, url).to_return(body: response)
    end
  end
end
