# NS1

[NS1](https://ns1.com/) API Client

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ns1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ns1

## Usage

```ruby
# Instantiate a client
client = NS1::Client.new("your api key")

# ZONES

# Get all active zones and basic zone configuration details for each.
client.zones 

# Get a single active Zone and its basic configuration details.
client.zone("example.com")

# Create a new DNS zone
# For details on configuration options, see https://ns1.com/api#create-a-new-dns-zone
client.create_zone("yourdomain.com", { optional: :params }) 

# Modify basic details of a DNS zone
client.modify_zone("yourdomain.com", { refresh: 3600 }) 

# Delete an existing DNS zone and all records in the zone
client.delete_zone("yourdomain.com") 

# RECORDS

# Get full configuration for a DNS record
client.record("example.com", "www.example.com", "A")

# Create a new DNS record in the specified zone, for the specified domain, of the given record type
# `answers` option is required. For other options, see https://ns1.com/api#create-a-new-dns-record
client.create_record("yourdomain.com", "www.yourdomain.com", "A", { answers: [] })

# Modify configuration details for an existing DNS record.
client.modify_record("yourdomain.com", "www.yourdomain.com", "A" { use_client_subnet: false })

# Remove an existing record and all associated answers and configuration details
client.delete_record("yourdomain.com", "www.yourdomain.com", "A")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kitop/ns1-ruby.
