require "spec_helper"

RSpec.describe NS1::Transport::NetHttp do
  let(:key) { "s3cr3tk3y" }
  let(:base_url) { NS1::Client::BASE_URL }
  let(:transport) { NS1::Transport::NetHttp.new(base_url, key) }

  describe "#request" do
    it "sends an authentication header" do
      request = stub_api(:get, "/example")
                  .with(headers: { "X-NSONE-Key" => key })

      transport.request("GET", "/example")

      expect(request).to have_been_requested
    end

    it "sends a Content-Type header when body is provided" do
      body = JSON.dump(foo: :bar)
      request = stub_api(:post, "/example")
                  .with(body: body, headers: { "Content-Type" => "application/json"})

      transport.request("POST", "/example", body)

      expect(request).to have_been_requested
    end

    it "raises an error when parsing fails" do
      stub_api(:get, "/example", response: "invalidjson")

      expect {
        transport.request("GET", "/example")
      }.to raise_error NS1::Transport::ResponseParseError
    end

    it "returns NS1::Response::Success on success response" do
      stub_api(:get, "/example", status: 200)

      response = transport.request("GET", "/example")

      expect(response).to be_a NS1::Response::Success
    end

    it "returns NS1::Response::Error on non-200 response" do
      stub_api(:get, "/example", status: 400)

      response = transport.request("GET", "/example")

      expect(response).to be_a NS1::Response::Error
    end
  end
end
