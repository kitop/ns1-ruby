require "bundler/setup"
require "ns1"
require "webmock/rspec"

Dir[File.expand_path("../support/**/*.rb", __FILE__)].each { |f| puts f; require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  WebMock.disable_net_connect!(net_http_connect_on_start: true)

  config.include SpecHelpers::StubRequestHelpers
end
