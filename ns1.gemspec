
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ns1/version"

Gem::Specification.new do |spec|
  spec.name          = "ns1"
  spec.version       = NS1::VERSION
  spec.authors       = ["Esteban Pastorino"]
  spec.email         = ["ejpastorino@gmail.com"]
  spec.license       = "MIT"

  spec.summary       = %q{NS1 API Client}
  spec.description   = %q{NS1 API Client}
  spec.homepage      = "https://github.com/kitop/ns1"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features|tmp)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.3.0"
end
