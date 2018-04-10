require "spec_helper"

RSpec.describe NS1::API::Records do
  let(:api_key) { "s3cr3tk3y" }
  let(:client) { NS1::Client.new(api_key) }

  describe "#record" do
    it "raises an error on nil zone" do
      expect {
        client.record(nil, nil, nil)
      }.to raise_error NS1::MissingParameter
    end

    it "requests GET /v1/zones/:zone/:domain/:type" do
      request = stub_api(:get, "/v1/zones/example.com/www.example.com/A")

      client.record("example.com", "www.example.com", "A")

      expect(request).to have_been_requested
    end
  end

  describe "#create_record" do
    it "raises an error when no zone, record, or type" do
      expect {
        client.create_record("", "", "", { ttl: 60 })
      }.to raise_error NS1::MissingParameter
    end

    it "raises an error when no answers" do
      expect {
        client.create_record("example.com", "www.example.com", "A", { ttl: 60 })
      }.to raise_error NS1::MissingParameter
    end

    it "requests PUT /v1/zones/:zone/:domain/:type" do
      expected_body = { answers: [],  zone: "example.com", domain: "www.example.com", type: "A" }
      request = stub_api(:put, "/v1/zones/example.com/www.example.com/A")
                  .with(body: JSON.dump(expected_body))

      client.create_record("example.com", "www.example.com", "A", { answers: [] })

      expect(request).to have_been_requested
    end
  end

  describe "#modify_record" do
    it "requests POST /v1/zones/:zone/:domain/:type" do
      expected_body = { use_client_subnet: false }
      request = stub_api(:post, "/v1/zones/example.com/www.example.com/CNAME")
                  .with(body: JSON.dump(expected_body))

      client.modify_record("example.com", "www.example.com", "CNAME", { use_client_subnet: false } )

      expect(request).to have_been_requested
    end
  end

  describe "#delete_record" do
    it "requests DELETE /v1/zones/:zone/:domain/:type" do
      request = stub_api(:delete, "/v1/zones/example.com/www.example.com/CNAME")

      client.delete_record("example.com", "www.example.com", "CNAME")

      expect(request).to have_been_requested
    end
  end
end
