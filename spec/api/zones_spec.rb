require "spec_helper"

RSpec.describe NS1::API::Zones do
  let(:api_key) { "s3cr3tk3y" }
  let(:client) { NS1::Client.new(api_key) }

  describe "#zones" do
    it "requests GET /v1/zones" do
      request = stub_api(:get, "/v1/zones")

      client.zones

      expect(request).to have_been_requested
    end
  end

  describe "#zone" do
    it "raises an error on nil zone" do
      expect {
        client.zone(nil)
      }.to raise_error NS1::MissingParameter
    end

    it "requests GET /v1/zones" do
      request = stub_api(:get, "/v1/zones/example.com")

      client.zone("example.com")

      expect(request).to have_been_requested
    end
  end

  describe "#create_zone" do
    it "raises an error when no zone" do
      expect {
        client.create_zone(nil, nx_ttl: 600)
      }.to raise_error NS1::MissingParameter
    end

    it "requests PUT /v1/zones" do
      expected_body = { zone: "example.com" }
      request = stub_api(:put, "/v1/zones/example.com")
                  .with(body: JSON.dump(expected_body))

      client.create_zone("example.com")

      expect(request).to have_been_requested
    end
  end

  describe "#modify_zone" do
    it "requests POST /v1/zones/:zone" do
      expected_body = { ttl: 600 }
      request = stub_api(:post, "/v1/zones/example.com")
                  .with(body: JSON.dump(expected_body))

      client.modify_zone("example.com", ttl: 600)

      expect(request).to have_been_requested
    end
  end

  describe "#delete_zone" do
    it "requests DELETE /v1/zones/:zone" do
      request = stub_api(:delete, "/v1/zones/example.com")

      client.delete_zone("example.com")

      expect(request).to have_been_requested
    end
  end
end
